import Foundation

typealias JSON = [String: Any]

enum ConfigError: Error, CustomStringConvertible {
    case invalidID(String)
    case viewNotFound(String)
    case noPropsInView(String)
    case missingPropsSection
    case variationNotFound(String)

    var description: String {
        switch self {
        case .invalidID(let id):
            return "Некорректный id: \(id)"
        case .viewNotFound(let viewName):
            return "View \"\(viewName)\" не найден."
        case .noPropsInView(let viewName):
            return "У view \"\(viewName)\" нет поля props."
        case .missingPropsSection:
            return "В конфиге отсутствует секция props."
        case .variationNotFound(let variation):
            return "Вариация \"\(variation)\" не найдена."
        }
    }
}

final class ContextVariationUtility {

    // Полный конфиг: содержит "view" и "props".
    private let config: JSON

    init(config: JSON) {
        self.config = config
    }

    /// Функция, возвращающая конечный набор настроек для заданного id.
    /// - Parameter id: строка вида "viewName.variation1.variation2..."
    /// - Throws: `ConfigError`, если что-то не найдено или некорректно.
    /// - Returns: JSON (словарь [String: Any]) со всеми слитыми настройками.
    public func variationConfiguration(id: String) throws -> JSON {
        let parts = id.split(separator: ".").map { String($0) }
        guard !parts.isEmpty else {
            throw ConfigError.invalidID(id)
        }

        let viewName = parts[0]
        let variationChain = Array(parts.dropFirst())

        guard let viewSection = config["view"] as? JSON else {
            throw ConfigError.viewNotFound(viewName)
        }
        
        guard let thisView = viewSection[viewName] as? JSON else {
            throw ConfigError.viewNotFound(viewName)
        }

        guard let viewProps = thisView["props"] as? JSON else {
            throw ConfigError.noPropsInView(viewName)
        }

        var mergedResult = viewProps

        guard let globalProps = config["props"] as? JSON else {
            throw ConfigError.missingPropsSection
        }

        var mutableGlobalProps = globalProps
        let variations = mutableGlobalProps.removeValue(forKey: "variations") as? [JSON] ?? []

        deepMerge(target: &mergedResult, source: mutableGlobalProps)

        for variationId in variationChain {
            guard let variationObj = variations.first(where: {
                ($0["id"] as? String) == variationId
            }) else {
                throw ConfigError.variationNotFound(variationId)
            }

            if let variationProps = variationObj["props"] as? JSON {
                deepMerge(target: &mergedResult, source: variationProps)
            }
        }

        return mergedResult
    }

    /// Глубокое рекурсивное слияние словарей:
    /// если по ключу лежат оба словаря, объединяем рекурсивно;
    /// иначе перезаписываем значение target[key] значением из source.
    private func deepMerge(target: inout JSON, source: JSON) {
        for (key, sourceValue) in source {
            if
                let sourceDict = sourceValue as? JSON,
                let targetDict = target[key] as? JSON
            {
                var mergedDict = targetDict
                deepMerge(target: &mergedDict, source: sourceDict)
                target[key] = mergedDict
            } else {
                target[key] = sourceValue
            }
        }
    }
}
