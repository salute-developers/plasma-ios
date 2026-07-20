import Foundation

/// Категория токена из `meta.json`. Значение декодируется, но в генерации не используется,
/// поэтому неизвестные категории из свежих схем не должны ронять декод — маппим их в `.unknown`.
enum Category: String, Codable {
    case text
    case surface
    case background
    case outline
    case overlay
    case banner
    case banners
    case data
    case syntax
    case unknown

    init(from decoder: Decoder) throws {
        let raw = try decoder.singleValueContainer().decode(String.self)
        self = Category(rawValue: raw) ?? .unknown
    }
}
