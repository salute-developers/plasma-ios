import Foundation
@_exported import SDDSThemeCore

/**
 Структура `CellAppearance` определяет внешний вид и стили ячейки, включая типографику и цвета для различных элементов.
 
 - Properties:
 - size: Конфигурация размеров ячейки.
 - labelAppearance: Стиль типографики для лейбла.
 - labelColor: Цвет лейбла.
 - titleStyle: Стиль типографики для заголовка.
 - titleColor: Цвет заголовка.
 - subtitleStyle: Стиль типографики для подзаголовка.
 - subtitleColor: Цвет подзаголовка.
 - disclosureTextStyle: Стиль типографики для текста disclosure.
 - disclosureTextColor: Цвет текста disclosure.
 - disclosureIconColor: Цвет иконки disclosure.
 - avatarStyle: Стиль компонента Avatar.
 - iconButtonStyle: Стиль компонента IconButton.
 - checkBoxStyle: Стиль компонента CheckBox.
 - switchStyle: Стиль компонента Switch.
 - radioBoxStyle: Стиль компонента RadioBox.
 */
public struct CellAppearance {
    /**
     Конфигурация размеров ячейки.
     */
    public var size: CellSizeConfiguration
    
    /**
     Стиль типографики для лейбла.
     */
    public var labelTypography: TypographyConfiguration
    
    /**
     Цвет лейбла.
     */
    public var labelColor: ColorToken
    
    /**
     Стиль типографики для заголовка.
     */
    public var titleTypography: TypographyConfiguration
    
    /**
     Цвет заголовка.
     */
    public var titleColor: ColorToken
    
    /**
     Стиль типографики для подзаголовка.
     */
    public var subtitleTypography: TypographyConfiguration
    
    /**
     Цвет подзаголовка.
     */
    public var subtitleColor: ColorToken
    
    /**
     Стиль типографики для текста disclosure.
     */
    public var disclosureTextTypography: TypographyConfiguration
    
    /**
     Цвет текста disclosure.
     */
    public var disclosureTextColor: ColorToken
    
    /**
     Цвет иконки disclosure.
     */
    public var disclosureIconColor: ColorToken
    
    /**
     Стиль компонента Avatar.
     */
    public var avatarAppearance: AvatarAppearance
    
    /**
     Стиль компонента IconButton.
     */
    public var iconButtonAppearance: ButtonAppearance
//
//    /**
//     Стиль компонента CheckBox.
//     */
    public var checkBoxAppearance: CheckboxAppearance
//
//    /**
//     Стиль компонента RadioBox.
//     */
    public var radioBoxAppearance: RadioboxAppearance
//
//    /**
//     Стиль компонента Switch.
//     */
    public var switchAppearance: SwitchAppearance
//
//    public var disclosureIcon: DisclosureImage
    
    public init(
        size: CellSizeConfiguration = ZeroCellSize(),
        labelTypography: TypographyConfiguration = .default,
        labelColor: ColorToken = .clearColor,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ColorToken = .clearColor,
        disclosureTextTypography: TypographyConfiguration = .default,
        disclosureTextColor: ColorToken = .clearColor,
        disclosureIconColor: ColorToken = .clearColor,
        avatarAppearance: AvatarAppearance = AvatarAppearance(),
        iconButtonAppearance: ButtonAppearance = ButtonAppearance(),
        checkBoxAppearance: CheckboxAppearance = CheckboxAppearance(),
        radioBoxAppearance: RadioboxAppearance = RadioboxAppearance(),
        switchAppearance: SwitchAppearance = SwitchAppearance()
//        disclosureIcon: DisclosureImage
    ) {
        self.size = size
        self.labelTypography = labelTypography
        self.labelColor = labelColor
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.subtitleTypography = subtitleTypography
        self.subtitleColor = subtitleColor
        self.disclosureTextTypography = disclosureTextTypography
        self.disclosureTextColor = disclosureTextColor
        self.disclosureIconColor = disclosureIconColor
        self.avatarAppearance = avatarAppearance
        self.iconButtonAppearance = iconButtonAppearance
        self.checkBoxAppearance = checkBoxAppearance
        self.radioBoxAppearance = radioBoxAppearance
        self.switchAppearance = switchAppearance
//        self.disclosureIcon: DisclosureImage
    }
}
