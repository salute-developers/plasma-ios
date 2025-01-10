import Foundation
@_exported import SDDSThemeCore

/**
 `ChipAppearance` определяет внешний вид чипа, включая цвета и типографику.
 
 - Properties:
    - size: Конфигурация размеров для чипа.
    - titleColor: Цвет текста заголовка.
    - titleTypography: Типографика заголовка.
    - imageTintColor: Цвет иконки.
    - buttonTintColor: Цвет кнопки.
    - backgroundColor: Цвет чипа.
    - disabledAlpha: Прозрачность чипа в выключенном состоянии.
 */
public struct ChipAppearance: Hashable {
    let id = UUID()
    public let size: ChipSizeConfiguration
    public let titleColor: ColorToken
    public let titleTypography: TypographyConfiguration
    public let imageTintColor: ColorToken
    public let buttonTintColor: ColorToken
    public let backgroundColor: ColorToken
    public let shapeStyle: ComponentShapeStyle
    public let disabledAlpha: CGFloat

    public init(
        size: ChipSizeConfiguration = ZeroChipSize(),
        titleColor: ColorToken = .clearColor,
        titleTypography: TypographyConfiguration = .default,
        imageTintColor: ColorToken = .clearColor,
        buttonTintColor: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        shapeStyle: ComponentShapeStyle = .cornered,
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleColor = titleColor
        self.titleTypography = titleTypography
        self.imageTintColor = imageTintColor
        self.buttonTintColor = buttonTintColor
        self.backgroundColor = backgroundColor
        self.shapeStyle = shapeStyle
        self.disabledAlpha = disabledAlpha
    }
    
    public static func == (lhs: ChipAppearance, rhs: ChipAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
