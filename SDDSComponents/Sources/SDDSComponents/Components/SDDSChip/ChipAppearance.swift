import Foundation
@_exported import SDDSThemeCore

/**
 `ChipAppearance` определяет внешний вид чипа, включая цвета и типографику.
 
 - Properties:
    - titleColor: Цвет текста заголовка.
    - titleTypography: Типографика заголовка.
    - imageTintColor: Цвет иконки.
    - buttonTintColor: Цвет кнопки.
    - backgroundColor: Цвет чипа.
    - disabledAlpha: Прозрачность чипа в выключенном состоянии.
 */
public struct ChipAppearance: Hashable {
    let id = UUID()
    public let titleColor: ColorToken
    public let titleTypography: TypographyConfiguration
    public let imageTintColor: ColorToken
    public let buttonTintColor: ColorToken
    public let backgroundColor: ColorToken
    public let disabledAlpha: CGFloat

    public init(
        titleColor: ColorToken,
        titleTypography: TypographyConfiguration, 
        imageTintColor: ColorToken,
        buttonTintColor: ColorToken,
        backgroundColor: ColorToken,
        disabledAlpha: CGFloat
    ) {
        self.titleColor = titleColor
        self.titleTypography = titleTypography
        self.imageTintColor = imageTintColor
        self.buttonTintColor = buttonTintColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
    }
    
    public static func == (lhs: ChipAppearance, rhs: ChipAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
