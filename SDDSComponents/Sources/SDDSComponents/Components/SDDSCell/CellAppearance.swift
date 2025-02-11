import Foundation
import SwiftUI

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
    public var labelTypography: Font
    
    /**
     Цвет лейбла.
     */
    public var labelColor: Color
    
    /**
     Стиль типографики для заголовка.
     */
    public var titleTypography: Font
    
    /**
     Цвет заголовка.
     */
    public var titleColor: Color
    
    /**
     Стиль типографики для подзаголовка.
     */
    public var subtitleTypography: Font
    
    /**
     Цвет подзаголовка.
     */
    public var subtitleColor: Color
    
    /**
     Стиль типографики для текста disclosure.
     */
    public var disclosureTextTypography: Font
    
    /**
     Цвет текста disclosure.
     */
    public var disclosureTextColor: Color
    
    /**
     Цвет иконки disclosure.
     */
    public var disclosureIconColor: Color
    
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
    
    public var disclosureIcon: Image
    
}
