import Foundation

protocol ContexBuilder: AnyObject {
    func buildContext(from data: Data) -> CommandResult
    
    func buildContext(from data: Data, transform: ([String: Any]) -> ([String: Any])) -> CommandResult
    
    func didReceiveContext(dictionary: [String: Any]) throws
}

extension ContexBuilder {
    func didReceiveContext(dictionary: [String: Any]) throws {}
    
    func prepareContext(from data: Data, transform: (_ json: [String: Any]) -> ([String: Any])) -> CommandResult {
        do {
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                try didReceiveContext(dictionary: dictionary)
                return prepareContext(fromDictionary: dictionary, transform: transform)
            } else {
                return .error(GeneralError.decoding)
            }
        } catch {
            return .error(.nsError(error))
        }
    }
    
    func prepareContext(fromDictionary dictionary: [String: Any], transform: (_ json: [String: Any]) -> ([String: Any])) -> CommandResult {
        var dictionary = dictionary
        dictionary.replaceKeys(transform: { $0.camelCase })
        
        return .dictionary(transform(dictionary))
    }
    
    func buildContext(from data: Data) -> CommandResult {
        prepareContext(from: data) { json in
            var context = [String: Any]()
            context["json"] = json
            return context
        }
    }
    
    func buildContext(from data: Data, transform: ([String: Any]) -> ([String: Any])) -> CommandResult {
        buildContext(from: data)
    }
}
