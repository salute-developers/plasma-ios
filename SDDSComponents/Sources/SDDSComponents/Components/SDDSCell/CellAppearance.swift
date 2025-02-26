import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
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
 - disclosureImageColor: Цвет иконки disclosure.
 - avatarStyle: Стиль компонента Avatar.
 - iconButtonStyle: Стиль компонента IconButton.
 - checkBoxStyle: Стиль компонента CheckBox.
 - switchStyle: Стиль компонента Switch.
 - radioBoxStyle: Стиль компонента RadioBox.
 */
public struct CellAppearance {
    public var size: CellSizeConfiguration
    public var labelTypography: TypographyConfiguration
    public var labelColor: ColorToken
    public var titleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var subtitleTypography: TypographyConfiguration
    public var subtitleColor: ColorToken
    public var disclosureTextTypography: TypographyConfiguration
    public var disclosureTextColor: ColorToken
    public var disclosureImageColor: ColorToken
    public var disclosureImage: Image?
    public var avatarAppearance: AvatarAppearance
    public var buttonAppearance: ButtonAppearance
    public var checkboxAppearance: CheckboxAppearance
    public var radioboxAppearance: RadioboxAppearance
    public var switchAppearance: SwitchAppearance
    
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
        disclosureImageColor: ColorToken = .clearColor,
        disclosureImage: Image? = nil,
        avatarAppearance: AvatarAppearance = AvatarAppearance.defaultValue,
        buttonAppearance: ButtonAppearance = ButtonAppearance.defaultValue,
        checkboxAppearance: CheckboxAppearance = CheckboxAppearance.defaultValue,
        radioboxAppearance: RadioboxAppearance = RadioboxAppearance.defaultValue,
        switchAppearance: SwitchAppearance = SwitchAppearance.defaultValue
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
        self.disclosureImageColor = disclosureImageColor
        self.disclosureImage = disclosureImage
        self.avatarAppearance = avatarAppearance
        self.buttonAppearance = buttonAppearance
        self.checkboxAppearance = checkboxAppearance
        self.radioboxAppearance = radioboxAppearance
        self.switchAppearance = switchAppearance
    }
}
