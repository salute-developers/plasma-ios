import Foundation
import SwiftUI

final class TypographyContextBuilder: ContexBuilder {
    private let fontFamiliesContainer: FontFamiliesContainer
    
    init(fontFamiliesContainer: FontFamiliesContainer) {
        self.fontFamiliesContainer = fontFamiliesContainer
    }
    
    func buildContext(from data: Data) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return prepareContext(fromDictionary: dictionary) { json in
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

// MARK: - Transform keys
extension TypographyContextBuilder {
    func prepareContext(fromDictionary dictionary: [String: Any], transform: (_ json: [String: Any]) -> ([String: Any])) -> CommandResult {
        
        var result = [String: [String: Any]]()
        for key in dictionary.keys {
            var tokenDictionary = dictionary[key] as? [String: Any]
            
            let fontFamilyRefKey = "fontFamilyRef"
            let fontFamilyRef = tokenDictionary?[fontFamilyRefKey] as? String ?? ""
            guard let weight = TypographyToken.Weight(rawValue: tokenDictionary?["weight"] as? String ?? ""), 
                    let style = TypographyToken.Style(rawValue: tokenDictionary?["style"] as? String ?? "") else {
                fatalError("Invalid token format")
            }
            
            guard let fontName = findFont(with: fontFamilyRef, weight: weight, style: style) else {
                continue
            }
            
            tokenDictionary?["fontName"] = fontName
            
            // Приведение словарей к формату кодогенерации
            var components = key.keyComponents
            guard let screenSize = ScreenSize(rawValue: components.first ?? "") else {
                fatalError("Invalid screen size")
            }
            
            components.removeFirst()
            let newKey = components.camelCase
            var screenSizeDictionary = result[newKey, default: [:]]
            screenSizeDictionary[screenSize.tokenValue.rawValue] = tokenDictionary
            
            result[newKey] = screenSizeDictionary
        }
        
        return .dictionary(transform(result))
    }
    
    private func findFont(with fontFamilyRef: String, weight: TypographyToken.Weight, style: TypographyToken.Style) -> String? {
        guard let heading = FontFamily.Key(rawValue: fontFamilyRef.keyComponents.last ?? ""),
              let fontFamily = fontFamiliesContainer.items[heading],
              let font = fontFamily.fonts.first(where: { $0.fontWeight == weight.fontWeight && $0.fontStyle == style.fontStyle }) else {
            print("Font with family ref: \(fontFamilyRef), weight: \(weight.rawValue), style: \(style.rawValue) is not found")
            return nil
        }
        
        return font.fontName
    }
}

private extension TypographyToken.Weight {
    var fontWeight: Font.Weight {
        switch self {
        case .black:
            fatalError() // Не определено
        case .bold:
            return .bold
        case .heavy:
            fatalError() // Не определено
        case .light:
            return .light
        case .medium:
            return .medium
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        case .thin:
            return .thin
        case .ultraLight:
            fatalError() // Не определено
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
