import Foundation

final class TypographyContextBuilder: ContexBuilder {
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
            
            // Подстановка `fontFamilyRef` (заглушка, далее здесь будет значение `FontFamilyToken`)
            let fontFamilyRefKey = "fontFamilyRef"
            let fontFamilyRef = tokenDictionary?[fontFamilyRefKey] as? String ?? ""
            tokenDictionary?[fontFamilyRefKey] = FontFamilyToken.Heading(rawValue: fontFamilyRef.keyComponents.last ?? "")?.rawValue
            
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
}
