import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `CodeInputAppearance` определяет внешний вид компонента CodeInput.
 */
@ApiInfo
public struct CodeInputAppearance {
    public var codeColor: StatefulFillStyle
    public var captionColor: StatefulFillStyle
    public var strokeColor: StatefulFillStyle
    public var fillColor: StatefulFillStyle
    public var codeTypography: TypographyConfiguration
    public var captionTypography: TypographyConfiguration
    public var size: CodeInputSizeConfiguration
    
    public init(
        codeColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        captionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        strokeColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        fillColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        codeTypography: TypographyConfiguration = .default,
        captionTypography: TypographyConfiguration = .default,
        size: CodeInputSizeConfiguration = CodeInputSize()
    ) {
        self.codeColor = codeColor
        self.captionColor = captionColor
        self.strokeColor = strokeColor
        self.fillColor = fillColor
        self.codeTypography = codeTypography
        self.captionTypography = captionTypography
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        codeColor: ColorToken = .clearColor,
        codeColorError: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorError: ColorToken = .clearColor,
        strokeColor: ColorToken = .clearColor,
        strokeColorError: ColorToken = .clearColor,
        strokeColorFocused: ColorToken = .clearColor,
        fillColor: ColorToken = .clearColor,
        fillColorError: ColorToken = .clearColor,
        codeTypography: TypographyConfiguration = .default,
        captionTypography: TypographyConfiguration = .default,
        size: CodeInputSizeConfiguration = CodeInputSize()
    ) {
        self.init(
            codeColor: StatefulFillStyle(
                defaultValue: .color(codeColor),
                values: [.init(states: [InteractiveState.error], value: .color(codeColorError))]
            ),
            captionColor: StatefulFillStyle(
                defaultValue: .color(captionColor),
                values: [.init(states: [InteractiveState.error], value: .color(captionColorError))]
            ),
            strokeColor: StatefulFillStyle(
                defaultValue: .color(strokeColor),
                values: [
                    .init(states: [InteractiveState.error], value: .color(strokeColorError)),
                    .init(states: [InteractiveState.focused], value: .color(strokeColorFocused))
                ]
            ),
            fillColor: StatefulFillStyle(
                defaultValue: .color(fillColor),
                values: [.init(states: [InteractiveState.error], value: .color(fillColorError))]
            ),
            codeTypography: codeTypography,
            captionTypography: captionTypography,
            size: size
        )
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use codeColor.resolvedValue(for: [.error]).")
    public var codeColorError: ColorToken {
        codeColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use captionColor.resolvedValue(for: [.error]).")
    public var captionColorError: ColorToken {
        captionColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use strokeColor.resolvedValue(for: [.error]).")
    public var strokeColorError: ColorToken {
        strokeColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use strokeColor.resolvedValue(for: [.focused]).")
    public var strokeColorFocused: ColorToken {
        strokeColor.resolvedValue(for: Set([InteractiveState.focused])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use fillColor.resolvedValue(for: [.error]).")
    public var fillColorError: ColorToken {
        fillColor.resolvedValue(for: Set([InteractiveState.error]), default: .color(.clearColor)).representativeColorToken
    }
}

// MARK: - Environment Key

extension CodeInputAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        CodeInputAppearance()
    }
}

public extension EnvironmentValues {
    var codeInputAppearance: CodeInputAppearance {
        get { self[CodeInputAppearance.self] }
        set { self[CodeInputAppearance.self] = newValue }
    }
}
