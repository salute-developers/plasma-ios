import Foundation
@_exported import SDDSThemeCore

/**
 Структура `CellAppearance` определяет внешний вид и стили ячейки, включая типографику и цвета для различных элементов.
 
 - Properties:
 - size: Конфигурация размеров ячейки.
 - labelStyle: Стиль типографики для лейбла.
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
    
    /**
     Стиль компонента CheckBox.
     */
    public var checkBoxStyle: CheckboxAppearance
    
    /**
     Стиль компонента RadioBox.
     */
    public var radioBoxStyle: RadioboxAppearance
    
    /**
     Стиль компонента Switch.
     */
    public var switchStyle: SwitchAppearance
    
    public var disclosureIcon: DisclosureImage
    
}
