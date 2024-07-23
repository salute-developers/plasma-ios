import Foundation
@_exported import SDDSThemeCore

/**
 `ChipAppearance` определяет внешний вид чипа, включая цвета и типографику.
 
 - Properties:
    - titleColor: Цвет текста заголовка.
    - titleTypography: Типографика заголовка.
    - imageTintColor: Цвет иконки.
    - buttonTintColor: Цвет кнопки.
    - disabledAlpha: Прозрачность чипа в выключенном состоянии.
 */
public struct ChipAppearance {
    public let titleColor: ColorToken
    public let titleTypography: TypographyToken
    public let imageTintColor: ColorToken
    public let buttonTintColor: ColorToken
    public let disabledAlpha: CGFloat

    public init(titleColor: ColorToken, titleTypography: TypographyToken, imageTintColor: ColorToken, buttonTintColor: ColorToken, disabledAlpha: CGFloat) {
        self.titleColor = titleColor
        self.titleTypography = titleTypography
        self.imageTintColor = imageTintColor
        self.buttonTintColor = buttonTintColor
        self.disabledAlpha = disabledAlpha
    }
}
