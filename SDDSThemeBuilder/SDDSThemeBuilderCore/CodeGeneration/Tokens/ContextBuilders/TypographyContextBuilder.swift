import Foundation
import SwiftUI

final class TypographyContextBuilder: ContexBuilder, SchemeTokenNameValidator {
    private let fontFamiliesContainer: FontFamiliesContainer
    private let metaScheme: Scheme
    
    init(fontFamiliesContainer: FontFamiliesContainer, metaScheme: Scheme) {
        self.fontFamiliesContainer = fontFamiliesContainer
        self.metaScheme = metaScheme
    }
    
    func buildContext(from data: Data) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                let result = try prepareContext(fromDictionary: dictionary) { json in
                    var context = [String: Any]()
                    context["json"] = json
                    return context
                }
                return result
            } else {
                return .error(GeneralError.decoding)
            }
        } catch {
            return .error(.nsError(error))
        }
    }
}

// MARK: - Transform keys
extension TypographyContextBuilder {
    func prepareContext(fromDictionary dictionary: [String: Any], transform: (_ json: [String: Any]) -> ([String: Any])) throws -> CommandResult {
        
        var result = [String: [String: Any]]()
        for key in dictionary.keys {
            try validateTokenName(key, .typography, scheme: metaScheme)
            var tokenDictionary = dictionary[key] as? [String: Any]
            
            let fontFamilyRefKey = "fontFamilyRef"
            guard let weight = TypographyToken.Weight(rawValue: tokenDictionary?["weight"] as? String ?? ""),
                  let style = TypographyToken.Style(rawValue: tokenDictionary?["style"] as? String ?? "") else {
                return .error(GeneralError.invalidTokenFormat)
            }
            
            let fontFamilyRef = tokenDictionary?[fontFamilyRefKey] as? String ?? ""
            guard let fontName = findFont(with: fontFamilyRef, weight: weight, style: style) else {
                continue
            }
            
            tokenDictionary?["fontName"] = fontName
            
            // Transform the dictionary keys for code generation format
            var components = key.keyComponents
            guard let screenSize = ScreenSize(rawValue: components.first ?? "") else {
                return .error(GeneralError.invalidScreenSize)
            }
            
            components.removeFirst()
            let newKey = components.camelCase
            var screenSizeDictionary = result[newKey, default: [:]]
            screenSizeDictionary[screenSize.tokenValue.rawValue] = tokenDictionary
            
            result[newKey] = screenSizeDictionary
        }
        
        let fallbackScreenResult = populateMissingScreenSizes(&result)
        if fallbackScreenResult.isError {
            return fallbackScreenResult
        }
        
        return .dictionary(transform(result))
    }
    
    private func populateMissingScreenSizes(_ dictionary: inout [String: [String: Any]]) -> CommandResult {
        guard !dictionary.isEmpty else {
            Logger.printText("Missing screen sizes")
            return .error(GeneralError.invalidScreenSize)
        }
        for (key, value) in dictionary {
            var value = value
            var availableSizes = Set<TypographyToken.ScreenSize>()
            for screenSize in TypographyToken.ScreenSize.allCases {
                if value[screenSize.rawValue] != nil {
                    availableSizes.insert(screenSize)
                }
            }
            
            for screenSize in TypographyToken.ScreenSize.allCases {
                if value[screenSize.rawValue] == nil {
                    Logger.printText("Finding fallback screen size for \(key)...")
                    if let fallbackScreenSize = getFallbackScreenSize(for: screenSize, in: availableSizes) {
                        value[screenSize.rawValue] = value[fallbackScreenSize.rawValue]
                    } else {
                        Logger.printText("Sizes for \(key) are not defined")
                        return .error(GeneralError.invalidScreenSize)
                    }
                }
            }
            dictionary[key] = value
        }
        return .success
    }
    
    private func findFont(with fontFamilyRef: String, weight: TypographyToken.Weight, style: TypographyToken.Style) -> String? {
        guard let heading = FontFamily.Key(rawValue: fontFamilyRef.keyComponents.last ?? ""),
              let fontFamily = fontFamiliesContainer.items[heading],
              let font = fontFamily.fonts.first(where: { $0.weight == weight.fontWeight && $0.style == style.fontStyle }) else {
            Logger.printText("Font with family ref: \(fontFamilyRef), weight: \(weight.rawValue), style: \(style.rawValue) is not found")
            return nil
        }
        
        return font.fontName
    }
    
    private func getFallbackScreenSize(for missingSize: TypographyToken.ScreenSize, in availableSizes: Set<TypographyToken.ScreenSize>) -> TypographyToken.ScreenSize? {
        let screenSizesOrder: [TypographyToken.ScreenSize] = [.small, .medium, .large]
        
        guard let missingIndex = screenSizesOrder.firstIndex(of: missingSize) else {
            return nil
        }
        
        // Check for the previous sizes
        for index in stride(from: missingIndex - 1, through: 0, by: -1) {
            if availableSizes.contains(screenSizesOrder[index]) {
                return screenSizesOrder[index]
            }
        }
        
        // Check for the next sizes
        for index in missingIndex + 1..<screenSizesOrder.count {
            if availableSizes.contains(screenSizesOrder[index]) {
                return screenSizesOrder[index]
            }
        }
        
        return nil
    }
}

private extension TypographyToken.Weight {
    var fontWeight: Font.Weight {
        switch self {
        case .black:
            return .black
        case .bold:
            return .bold
        case .heavy:
            return .heavy
        case .light:
            return .light
        case .medium:
            return .medium
        case .regular, .normal:
            return .regular
        case .semibold:
            return .semibold
        case .thin:
            return .thin
        case .ultraLight:
            return .ultralight
        }
    }
}

private extension TypographyToken.Style {
    var fontStyle: Font.Style {
        switch self {
        case .italic:
            return .italic
        case .normal:
            return .normal
        }
    }
}
