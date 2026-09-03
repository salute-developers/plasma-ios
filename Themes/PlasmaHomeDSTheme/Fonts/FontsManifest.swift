import Foundation
import SDDSThemeCore

public struct FontInfo {
    public let url: String
    public let weight: String
    public let style: String
    public let filename: String
}

public struct FontsManifest {
    /// Upstream-ссылки на шрифты. Оставлены для трассировки: в рантайме не используются,
    /// шрифты вшиты в исходники темы (см. `embedded`).
    public static let fonts: [FontInfo] = [

    ]

    /// Шрифты, вшитые в тему. Регистрируются синхронно, без сети и без ресурсного бандла.
    public static let embedded: [EmbeddedFont] = [

    ]
}
