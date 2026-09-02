import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `CodeFieldAppearance` определяет внешний вид компонента CodeField.
 */
@ApiInfo
public struct CodeFieldAppearance {
    public var valueColor: StatefulFillStyle
    public var backgroundColor: StatefulFillStyle
    public var cursorColor: ColorToken
    public var captionColor: StatefulFillStyle
    public var dotColor: StatefulFillStyle
    public var captionTypography: TypographyConfiguration
    public var valueTypography: TypographyConfiguration
    public var size: CodeFieldSizeConfiguration
    
    public init(
        valueColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        cursorColor: ColorToken = .clearColor,
        captionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        dotColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        captionTypography: TypographyConfiguration = .default,
        valueTypography: TypographyConfiguration = .default,
        size: CodeFieldSizeConfiguration = CodeFieldSize()
    ) {
        self.valueColor = valueColor
        self.backgroundColor = backgroundColor
        self.cursorColor = cursorColor
        self.captionColor = captionColor
        self.dotColor = dotColor
        self.captionTypography = captionTypography
        self.valueTypography = valueTypography
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        valueColor: ColorToken = .clearColor,
        valueColorError: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        backgroundColorActivated: ColorToken = .clearColor,
        backgroundColorError: ColorToken = .clearColor,
        cursorColor: ColorToken = .clearColor,
        captionColor: ColorToken = .clearColor,
        captionColorError: ColorToken = .clearColor,
        dotColor: ColorToken = .clearColor,
        dotColorError: ColorToken = .clearColor,
        captionTypography: TypographyConfiguration = .default,
        valueTypography: TypographyConfiguration = .default,
        size: CodeFieldSizeConfiguration = CodeFieldSize()
    ) {
        self.init(
            valueColor: StatefulFillStyle(
                defaultValue: .color(valueColor),
                values: [.init(states: [InteractiveState.error], value: .color(valueColorError))]
            ),
            backgroundColor: StatefulFillStyle(
                defaultValue: .color(backgroundColor),
                values: [
                    .init(states: [InteractiveState.activated], value: .color(backgroundColorActivated)),
                    .init(states: [InteractiveState.error], value: .color(backgroundColorError))
                ]
            ),
            cursorColor: cursorColor,
            captionColor: StatefulFillStyle(
                defaultValue: .color(captionColor),
                values: [.init(states: [InteractiveState.error], value: .color(captionColorError))]
            ),
            dotColor: StatefulFillStyle(
                defaultValue: .color(dotColor),
                values: [.init(states: [InteractiveState.error], value: .color(dotColorError))]
            ),
            captionTypography: captionTypography,
            valueTypography: valueTypography,
            size: size
        )
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use valueColor.resolvedValue(for: [.error]).")
    public var valueColorError: ColorToken {
        valueColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use backgroundColor.resolvedValue(for: [.activated]).")
    public var backgroundColorActivated: ColorToken {
        backgroundColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use backgroundColor.resolvedValue(for: [.error]).")
    public var backgroundColorError: ColorToken {
        backgroundColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use captionColor.resolvedValue(for: [.error]).")
    public var captionColorError: ColorToken {
        captionColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use dotColor.resolvedValue(for: [.error]).")
    public var dotColorError: ColorToken {
        dotColor.resolvedValue(for: Set([InteractiveState.error])).representativeColorToken
    }
}

// MARK: - Environment Key

extension CodeFieldAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        CodeFieldAppearance()
    }
}

public extension EnvironmentValues {
    var codeFieldAppearance: CodeFieldAppearance {
        get { self[CodeFieldAppearance.self] }
        set { self[CodeFieldAppearance.self] = newValue }
    }
}
