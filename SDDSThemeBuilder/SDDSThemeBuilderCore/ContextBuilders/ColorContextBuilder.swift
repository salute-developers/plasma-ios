import Foundation

struct ColorMap {
    let hex: String?
    let alpha: CGFloat?
    
    init(hex: String?, alpha: CGFloat? = nil) {
        self.hex = hex
        self.alpha = alpha
    }
}

extension ColorMap {
    var hexWithAlpha: String? {
        if let alpha = alpha {
            return hex?.applyAlpha(alpha: alpha)
        } else {
            return hex
        }
    }
}

final class ColorContextBuilder: ContexBuilder, ThemeContext, ColorContext, SchemeTokenNameValidator {
    let paletteURL: URL
    let metaScheme: Scheme
    
    private lazy var paletteJson: [String: Any]? = {
        guard let data = try? Data(contentsOf: paletteURL) else {
            return nil
        }
        
        return try? JSONSerialization.jsonObject(with: data) as? [String: Any]
    }()
    
    init(paletteURL: URL, metaScheme: Scheme) {
        self.paletteURL = paletteURL
        self.metaScheme = metaScheme
    }
    
    func buildContext(from data: Data) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let result = try buildColorThemeContext(from: dictionary, transform: getColorMap)
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

// MARK: - Dark & Light Theme
extension ColorContextBuilder {
    func buildColorThemeContext(from dictionary: [String: Any], transform: (_ colorMap: String, _ paletteJson: [String: Any]?) throws -> (ColorMap)) throws -> Result<[String: Any], Error> {
        var result = [String: Any]()
        for key in dictionary.keys {
            validateTokenName(key, .color, scheme: metaScheme)
            
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
                let colorMap = try transform(hex, paletteJson)
                guard var hexValue = colorMap.hex, !hexValue.isEmpty else {
                    return .failure(GeneralError.invalidHex)
                }
                
                let hexWithAlpha = colorMap.hexWithAlpha
                guard hexWithAlpha?.isEmpty == false else {
                    return .failure(GeneralError.invalidHex)
                }
                value[mode.rawValue] = hexWithAlpha
                result[colorName] = value
            }
        }
        populateMissingColors(&result)
        
        return .success(result)
    }
}
