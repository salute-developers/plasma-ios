import Foundation

final class TypographyContextBuilder: ContexBuilder {
    func buildContext(from data: Data) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                return prepareContext(fromDictionary: dictionary) { [weak self] json in
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

// MARK: - Transform keys
extension TypographyContextBuilder {
    /// ключ вида `screenS.display.s.normal` преобразуется в ключ вида `displaySNormalScreenS`
    func prepareContext(fromDictionary dictionary: [String: Any], transform: (_ json: [String: Any]) -> ([String: Any])) -> CommandResult {
        var dictionary = dictionary
        dictionary.replaceKeys { key in
            let components = key.keyComponents
            guard let screenSize = ScreenSize(rawValue: components.first ?? "") else {
                fatalError("Unsupported screen size")
            }
            
            return (Array(components.dropFirst()) + [screenSize.camelCase]).camelCase
        }
        for key in dictionary.keys {
            var typographyDictionary = dictionary[key] as? [String: Any]
            let fontFamilyRefKey = "fontFamilyRef"
            guard let fontFamilyRefValue = typographyDictionary?[fontFamilyRefKey] as? String else {
                fatalError("Missing fontFamilyRef key")
            }
            let components = fontFamilyRefValue.keyComponents
            guard let heading = FontFamilyToken.Heading(rawValue: components.last ?? "") else {
                fatalError("Unsupported fontFamilyRef value")
            }
            typographyDictionary?[fontFamilyRefKey] = heading.rawValue
            dictionary[key] = typographyDictionary
        }
        
        return .dictionary(transform(dictionary))
    }
}
