import Foundation

/// Навигационная структура авторской документации (`structure.json`) —
/// формат dsbuilder CLI (Core- и user-слои читаются одинаково).
public struct DocsStructure: Codable {
    /// Версия схемы навигации: обязательное поле, dsbuilder падает без него.
    public var schemaVersion: String = Self.currentSchemaVersion
    public var navigation: [Node]

    public static let currentSchemaVersion = "1.0"

    public struct Node: Codable {
        public var title: String
        public var path: String?
        public var subjects: [String]?
        public var hidden: Bool?
        /// `append` (default, файл с `+`-префиксом) | `replace`; `prepend` отклоняется.
        public var merge: String?
        public var items: [Node]?
    }

    public init(navigation: [Node], schemaVersion: String = Self.currentSchemaVersion) {
        self.schemaVersion = schemaVersion
        self.navigation = navigation
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // Авторские structure.json версию не указывают — она наша, выходная.
        schemaVersion = try container.decodeIfPresent(String.self, forKey: .schemaVersion)
            ?? Self.currentSchemaVersion
        navigation = try container.decode([Node].self, forKey: .navigation)
    }

    public static func load(from url: URL) throws -> DocsStructure {
        try JSONDecoder().decode(DocsStructure.self, from: Data(contentsOf: url))
    }

    /// Все `path` дерева в порядке обхода.
    public var pagePaths: [String] {
        var result: [String] = []
        func walk(_ nodes: [Node]) {
            for node in nodes {
                if let path = node.path { result.append(path) }
                walk(node.items ?? [])
            }
        }
        walk(navigation)
        return result
    }

    /// Пары (path, merge) для валидации user-слоя.
    public var pageMerges: [(path: String, merge: String?)] {
        var result: [(String, String?)] = []
        func walk(_ nodes: [Node]) {
            for node in nodes {
                if let path = node.path { result.append((path, node.merge)) }
                walk(node.items ?? [])
            }
        }
        walk(navigation)
        return result
    }
}

/// Ошибки агрегации — все «громкие»: спека требует fail loud, а не молчаливый
/// пропуск (главный урок от awk-пайплайна docusaurus).
public enum AggregationError: Error, CustomStringConvertible {
    case missingInput(String)
    case structurePageMissing(structure: String, page: String)
    case unresolvedSample(page: String, marker: String)
    case userMergePrependRejected(page: String)
    case userAppendRequiresPlusPrefix(page: String)

    public var description: String {
        switch self {
        case .missingInput(let path):
            return "отсутствует обязательный вход: \(path)"
        case .structurePageMissing(let structure, let page):
            return "\(structure): страница из структуры не найдена на диске: \(page)"
        case .unresolvedSample(let page, let marker):
            return "\(page): не резолвится сэмпл \(marker)"
        case .userMergePrependRejected(let page):
            return "user-слой: merge=prepend не поддерживается (\(page))"
        case .userAppendRequiresPlusPrefix(let page):
            return "user-слой: merge=append требует `+`-префикс имени файла (\(page))"
        }
    }
}
