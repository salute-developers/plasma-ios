import Foundation

/// Идентификатор тенанта темы.
///
/// Тенант — это дополнительный набор токенов (полный, как обычная тема),
/// который накладывается на базовую тему в рантайме. См. ``ThemeTenantRegistry``.
public struct Tenant: Hashable, Sendable {
    /// Имя тенанта (например, `"Gold"`). Должно совпадать с именем, под которым
    /// зарегистрирован резолвер в ``ThemeTenantRegistry``.
    public let name: String

    public init(name: String) {
        self.name = name
    }

    /// Базовый тенант — без перекрытий, используются токены базовой темы.
    public static let none = Tenant(name: "")

    /// Является ли тенант базовым (без перекрытий).
    public var isNone: Bool {
        name.isEmpty
    }
}
