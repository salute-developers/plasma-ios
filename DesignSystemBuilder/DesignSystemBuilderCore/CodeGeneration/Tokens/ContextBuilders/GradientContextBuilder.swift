import Foundation
import SwiftUI

final class GradientContextBuilder: ContexBuilder, ThemeContext, ColorContext, SchemeTokenNameValidator {
    private let paletteURL: URL
    private let metaScheme: Scheme
    
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
                let result = try buildGradientThemeContext(from: dictionary, transform: getColorMap)
                switch result {
                case .success(let context):
                    return prepareContext(fromDictionary: context) { json in
                        var context = [String: Any]()
                        context["json"] = json
                        return context
                    }
                case .failure(let error):
                    return .error(.nsError(error))
                }
            } else {
                return .error(GeneralError.decoding)
            }
        } catch {
            return .error(.nsError(error))
        }
    }
}

// MARK: - Dark & Light Theme
extension GradientContextBuilder {
    func buildGradientThemeContext(from dictionary: [String: Any], transform: (_ colorMap: String, _ paletteJson: [String: Any]?) throws -> (ColorMap)) throws -> Result<[String: Any], Error> {
        var result = [String: Any]()
        for key in dictionary.keys {
            try validateTokenName(key, .gradient, scheme: metaScheme)
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
                let colorsKey = GradientDictionaryKey.colors.rawValue
                let backgroundKey = GradientDictionaryKey.background.rawValue
                
                var gradients = dictionary[key] as? [[String: Any]] ?? []
                gradients = try gradients.map { gradientDictionary in
                    var gradientDictionary = gradientDictionary
                    if let colorsArray = gradientDictionary[colorsKey] as? [String] {
                        let colorMapArray: [ColorMap] = try colorsArray.map { color in
                            guard let result = try? transform(color, paletteJson) else {
                                throw GeneralError.invalidPalette
                            }
                            return result
                        }
                        let hexArray = try colorMapArray.map { colorMap in
                            guard let hex = colorMap.hexWithAlpha else {
                                throw GeneralError.invalidPalette
                            }
                            return hex
                        }
                        gradientDictionary[colorsKey] = hexArray
                    } else if let background = gradientDictionary[backgroundKey] as? String {
                        guard let colorMap = try? transform(background, paletteJson) else {
                            throw GeneralError.invalidPalette
                        }
                        gradientDictionary[backgroundKey] = colorMap.hexWithAlpha
                    }
                    return gradientDictionary
                }
                let gradient = gradients.first
                
                let kindString = (gradient?[GradientDictionaryKey.kind.rawValue] as? String) ?? ""
                switch kindString {
                case GradientKind.color.rawValue:
                    break
                case GradientKind.angular.rawValue, GradientKind.radial.rawValue, GradientKind.linear.rawValue:
                    guard let locations = gradient?[GradientDictionaryKey.locations.rawValue] as? [Double],
                          let colors = gradient?[GradientDictionaryKey.colors.rawValue] as? [String], locations.count == colors.count else {
                        return .failure(GeneralError.invalidColorTokenFormat)
                    }
                default:
                    return .failure(GeneralError.invalidColorTokenFormat)
                }
                
                value[mode.rawValue] = gradients
                result[colorName] = value
            }
        }
        populateMissingColors(&result)
        
        return .success(result)
    }
}

// MARK: - Constants
private enum GradientDictionaryKey: String {
    case colors
    case background
    case locations
    case kind
}

private enum GradientKind: String {
    case linear
    case radial
    case angular
    case color
}
