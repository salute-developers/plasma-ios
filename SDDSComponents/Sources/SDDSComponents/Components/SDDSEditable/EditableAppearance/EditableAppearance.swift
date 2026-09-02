import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

@ApiInfo
public struct EditableAppearance {
    @ApiName("textColor")
    public var textColor: StatefulFillStyle
    @ApiName("iconColor")
    public var iconColor: StatefulFillStyle
    public var cursorColor: ColorToken
    @ApiRawNumber
    public var disabledAlpha: CGFloat
    @ApiName("textStyle")
    public var textTypography: TypographyConfiguration
    public var size: EditableSizeConfiguration
    
    public init(
        textColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        iconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0.4,
        textTypography: TypographyConfiguration = .default,
        size: EditableSizeConfiguration = EditableSize()
    ) {
        self.textColor = textColor
        self.iconColor = iconColor
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.textTypography = textTypography
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        textColorDefault: ColorToken = .clearColor,
        textColorReadonly: ColorToken = .clearColor,
        iconColorDefault: ColorToken = .clearColor,
        iconColorReadonly: ColorToken = .clearColor,
        cursorColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0.4,
        textTypography: TypographyConfiguration = .default,
        size: EditableSizeConfiguration = EditableSize()
    ) {
        self.init(
            textColor: StatefulFillStyle(
                defaultValue: .color(textColorDefault),
                values: [.init(states: [InteractiveState.readonly], value: .color(textColorReadonly))]
            ),
            iconColor: StatefulFillStyle(
                defaultValue: .color(iconColorDefault),
                values: [.init(states: [InteractiveState.readonly], value: .color(iconColorReadonly))]
            ),
            cursorColor: cursorColor,
            disabledAlpha: disabledAlpha,
            textTypography: textTypography,
            size: size
        )
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use textColor.resolvedDefaultValue().")
    public var textColorDefault: ColorToken {
        textColor.resolvedDefaultValue().representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use textColor.resolvedValue(for: [.readonly]).")
    public var textColorReadonly: ColorToken {
        textColor.resolvedValue(for: Set([InteractiveState.readonly])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use iconColor.resolvedDefaultValue().")
    public var iconColorDefault: ColorToken {
        iconColor.resolvedDefaultValue().representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use iconColor.resolvedValue(for: [.readonly]).")
    public var iconColorReadonly: ColorToken {
        iconColor.resolvedValue(for: Set([InteractiveState.readonly])).representativeColorToken
    }
}

extension EditableAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EditableAppearance()
    }
}

public extension EnvironmentValues {
    var editableAppearance: EditableAppearance {
        get { self[EditableAppearance.self] }
        set { self[EditableAppearance.self] = newValue }
    }
}
