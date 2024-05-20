import Foundation
import SwiftUI

final class GradientContextBuilder: ContexBuilder {
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
                let context = buildGradientThemeContext(from: dictionary, transform: hex)
                return prepareContext(fromDictionary: context) { json in
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
extension GradientContextBuilder {
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
extension GradientContextBuilder {
    func buildGradientThemeContext(from dictionary: [String: Any], transform: (_ hex: String) -> (String) = { $0 }) -> [String: Any] {
        var result = [String: Any]()
        var dictionary = dictionary
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
                let colorsKey = GradientDictionaryKey.colors.rawValue
                let backgroundKey = GradientDictionaryKey.background.rawValue
                
                var gradients = dictionary[key] as? [[String: Any]] ?? []
                gradients = gradients.map { gradientDictionary in
                    var gradientDictionary = gradientDictionary
                    if let colorsArray = gradientDictionary[colorsKey] as? [String] {
                        let hexArray = colorsArray.map(transform)
                        gradientDictionary[colorsKey] = hexArray
                    } else if let background = gradientDictionary[backgroundKey] as? String {
                        gradientDictionary[backgroundKey] = hex(background)
                    }
                    return gradientDictionary
                }

                value[theme] = gradients
                result[colorName] = value
            default:
                fatalError("Color token should start with `light` or `dark` prefix")
            }
        }
        
        return result
    }
}

// MARK: - Constants
private enum GradientDictionaryKey: String {
    case colors
    case background
}
