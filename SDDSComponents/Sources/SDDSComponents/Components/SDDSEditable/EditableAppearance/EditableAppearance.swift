import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

@ApiInfo
public struct EditableAppearance {
    @ApiName("textColor")
    public var textColorDefault: ColorToken
    @ApiName("textColor")
    public var textColorReadonly: ColorToken
    @ApiName("iconColor")
    public var iconColorDefault: ColorToken
    @ApiName("iconColor")
    public var iconColorReadonly: ColorToken
    public var cursorColor: ColorToken
    @ApiRawNumber
    public var disabledAlpha: CGFloat
    @ApiName("textStyle")
    public var textTypography: TypographyConfiguration
    public var size: EditableSizeConfiguration
    
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
        self.textColorDefault = textColorDefault
        self.textColorReadonly = textColorReadonly
        self.iconColorDefault = iconColorDefault
        self.iconColorReadonly = iconColorReadonly
        self.cursorColor = cursorColor
        self.disabledAlpha = disabledAlpha
        self.textTypography = textTypography
        self.size = size
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
