import Foundation

final class ColorContextBuilder: ContexBuilder {
    let paletteURL: URL
    
    private lazy var paletteJson: [String: Any]? = {
        guard let data = try? Data(contentsOf: paletteURL) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }()
    
    init(paletteURL: URL) {
        self.paletteURL = paletteURL
    }
    
    func buildContext(from data: Data) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let context = buildColorThemeContext(from: dictionary, transform: hex)
                return prepareContext(fromDictionary: context) { [weak self] json in
                    guard let self = self else {
                        return [:]
                    }
                    
                    var context = [String: Any]()
                    context["json"] = json
                    return context
                }
            } else {
                return .error(GeneralError.decoding)
            }
        } catch {
            return .error(error)
        }
    }
    
}

// MARK: - Aliases
extension ColorContextBuilder {
    private func hex(_ value: String) -> String {
        if let alias = PaletteAlias(alias: value) {
            hex(by: alias) ?? ""
        } else {
            value
        }
    }
    
    private func hex(by alias: PaletteAlias) -> String? {
        let color = paletteJson?[alias.color] as? [String: Any]
        return color?[alias.tone] as? String
    }
}

// MARK: - Dark & Light Theme
extension ColorContextBuilder {
    func buildColorThemeContext(from dictionary: [String: Any], transform: (_ hex: String) -> (String) = { $0 }) -> [String: Any] {
        var result = [String: Any]()
        for key in dictionary.keys {
            let components = key.tokenComponents
            guard components.count > 1 else {
                fatalError("Color token `\(key)` has invalid format.")
            }
            let theme = components.first ?? ""
            let colorName = Array(components[1..<components.count]).camelCase
            switch theme {
            case "light", "dark":
                var value = result[colorName] as? [String: Any] ?? [:]
                
                guard let hex = dictionary[key] as? String else {
                    fatalError("Invalid color hex format")
                }
                let colorHex = transform(hex)
                value[theme] = colorHex
                result[colorName] = value
            default:
                fatalError("Color token should start with `light` or `dark` prefix")
            }
        }
        
        return result
    }
}
