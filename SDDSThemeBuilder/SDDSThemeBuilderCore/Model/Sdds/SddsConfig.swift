import Foundation

/// DTO для `.sdds/config.json`, который выгружает DS Builder CLI.
/// `tenants` описывают локальные источники токенов темы, `palettePath` — путь
/// к локальной палитре. Все пути относительны базовой директории (родителя `.sdds`).
struct SddsConfig: Codable {
    let tenants: [SddsTenant]
    let palettePath: String?

    private enum CodingKeys: String, CodingKey {
        case tenants
        case palettePath
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.tenants = try container.decodeIfPresent([SddsTenant].self, forKey: .tenants) ?? []
        self.palettePath = try container.decodeIfPresent(String.self, forKey: .palettePath)
    }
}

/// Tenant из `.sdds/config.json`. Публичное имя — `alias ?: name`.
/// Если `directoryPath` не задан, используется путь `.sdds/<name>`.
struct SddsTenant: Codable {
    let name: String
    let alias: String?
    let directoryPath: String?

    /// Публичное имя tenant'а: `alias`, если задан, иначе `name`.
    var publicName: String { alias ?? name }

    private enum CodingKeys: String, CodingKey {
        case name
        case alias
        case directoryPath
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.alias = try container.decodeIfPresent(String.self, forKey: .alias)
        self.directoryPath = try container.decodeIfPresent(String.self, forKey: .directoryPath)
    }
}
