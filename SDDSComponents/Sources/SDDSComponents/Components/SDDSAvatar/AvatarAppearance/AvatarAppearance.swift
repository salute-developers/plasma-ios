import Foundation
import SDDSThemeCore


/**
 `AvatarAppearance` определяет внешний вид аватара, включая цвет текста, фона, цвета статусов и типографику.

 - Properties:
    - size: Конфигурация размеров для аватара.
    - textFillStyle: Стиль заливки текста (цвет или градиент).
    - backgroundFillStyle: Стиль заливки фона (цвет или градиент).
    - onlineStatusColor: Цвет индикатора статуса "онлайн".
    - offlineStatusColor: Цвет индикатора статуса "оффлайн".
    - textTypography: Типографика текста.
 */
public struct AvatarAppearance: Hashable {
    let id = UUID()
    public let size: AvatarSizeConfiguration
    public let textFillStyle: FillStyle
    public let backgroundFillStyle: FillStyle
    public let backgroundOpacity: CGFloat
    public let onlineStatusColor: ColorToken
    public let offlineStatusColor: ColorToken
    public let textTypography: TypographyConfiguration
    
    public init(
        size: AvatarSizeConfiguration = ZeroAvatarSize(),
        textFillStyle: FillStyle = .color(.clearColor),
        backgroundFillStyle: FillStyle = .color(.clearColor),
        backgroundOpacity: CGFloat = 0,
        onlineStatusColor: ColorToken = .clearColor,
        offlineStatusColor: ColorToken = .clearColor,
        textTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.textFillStyle = textFillStyle
        self.backgroundFillStyle = backgroundFillStyle
        self.backgroundOpacity = backgroundOpacity
        self.onlineStatusColor = onlineStatusColor
        self.offlineStatusColor = offlineStatusColor
        self.textTypography = textTypography
    }
    
    public static func == (lhs: AvatarAppearance, rhs: AvatarAppearance) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
