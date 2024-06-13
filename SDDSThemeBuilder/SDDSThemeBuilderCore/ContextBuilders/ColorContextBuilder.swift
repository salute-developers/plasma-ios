import Foundation

final class ColorContextBuilder: ContexBuilder, ThemeContext {
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
                let result = buildColorThemeContext(from: dictionary, transform: hex)
                switch result {
                case .success(let context):
                    return prepareContext(fromDictionary: context) { json in
                        var context = [String: Any]()
                        context["json"] = json
                        return context
                    }
                case .failure(let error):
                    return .error(error)
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
            return hex(by: alias) ?? ""
        } else {
            return value
        }
    }
    
    private func hex(by alias: PaletteAlias) -> String? {
        let color = paletteJson?[alias.color] as? [String: Any]
        return color?[alias.tone] as? String
    }
}

// MARK: - Dark & Light Theme
extension ColorContextBuilder {
    func buildColorThemeContext(from dictionary: [String: Any], transform: (_ hex: String) -> (String) = { $0 }) -> Result<[String: Any], Error> {
        var result = [String: Any]()
        for key in dictionary.keys {
            let components = key.tokenComponents
            guard components.count > 1 else {
                return .failure(GeneralError.invalidColorTokenFormat)
            }
            guard let mode = Mode(rawValue: components.first ?? "") else {
                return .failure(GeneralError.invalidColorTokenFormat)
            }
            let colorName = Array(components[1..<components.count]).camelCase
            switch mode {
            case .light, .dark:
                var value = result[colorName] as? [String: Any] ?? [:]
                guard let hex = dictionary[key] as? String else {
                    return .failure(GeneralError.invalidHex)
                }
                let colorHex = transform(hex)
                guard !colorHex.isEmpty else {
                    return .failure(GeneralError.invalidHex)
                }
                
                value[mode.rawValue] = colorHex
                result[colorName] = value
            }
        }
        populateMissingColors(&result)
        
        return .success(result)
    }
}
