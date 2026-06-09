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
    public var labelColor: StatefulFillStyle
    public var titleTypography: TypographyConfiguration
    public var titleColor: StatefulFillStyle
    public var subtitleTypography: TypographyConfiguration
    public var subtitleColor: StatefulFillStyle
    public var disclosureTextTypography: TypographyConfiguration
    public var disclosureTextColor: StatefulFillStyle
    public var disclosureImageColor: StatefulFillStyle
    public var disclosureImage: Image?
    public var avatarAppearance: AvatarAppearance
    public var buttonAppearance: ButtonAppearance
    public var checkboxAppearance: CheckboxAppearance
    public var radioboxAppearance: RadioboxAppearance
    public var switchAppearance: SwitchAppearance
    
    public init(
        size: CellSizeConfiguration = ZeroCellSize(),
        labelTypography: TypographyConfiguration = .default,
        labelColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disclosureTextTypography: TypographyConfiguration = .default,
        disclosureTextColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        disclosureImageColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
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

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
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
        self.init(
            size: size,
            labelTypography: labelTypography,
            labelColor: labelColor.statefulColor.statefulFillStyle,
            titleTypography: titleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleTypography: subtitleTypography,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            disclosureTextTypography: disclosureTextTypography,
            disclosureTextColor: disclosureTextColor.statefulColor.statefulFillStyle,
            disclosureImageColor: disclosureImageColor.statefulColor.statefulFillStyle,
            disclosureImage: disclosureImage,
            avatarAppearance: avatarAppearance,
            buttonAppearance: buttonAppearance,
            checkboxAppearance: checkboxAppearance,
            radioboxAppearance: radioboxAppearance,
            switchAppearance: switchAppearance
        )
    }
}

extension CellAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: CellAppearance.self, fallback: CellAppearance())
    }
}
