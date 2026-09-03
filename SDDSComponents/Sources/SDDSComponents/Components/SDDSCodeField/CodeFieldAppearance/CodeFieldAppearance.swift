import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `CodeFieldAppearance` определяет внешний вид компонента CodeField.
 */
@ApiInfo
public struct CodeFieldAppearance {
    public var valueColor: ColorToken
    @ApiName("valueColor", state: .error)
    public var valueColorError: ColorToken
    public var backgroundColor: ColorToken
    @ApiName("backgroundColor", state: .activated)
    public var backgroundColorActivated: ColorToken
    @ApiName("backgroundColor", state: .error)
    public var backgroundColorError: ColorToken
    public var cursorColor: ColorToken
    public var captionColor: ColorToken
    @ApiName("captionColor", state: .error)
    public var captionColorError: ColorToken
    public var dotColor: ColorToken
    @ApiName("dotColor", state: .error)
    public var dotColorError: ColorToken
    public var captionTypography: TypographyConfiguration
    public var valueTypography: TypographyConfiguration
    public var size: CodeFieldSizeConfiguration

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
        self.valueColor = valueColor
        self.valueColorError = valueColorError
        self.backgroundColor = backgroundColor
        self.backgroundColorActivated = backgroundColorActivated
        self.backgroundColorError = backgroundColorError
        self.cursorColor = cursorColor
        self.captionColor = captionColor
        self.captionColorError = captionColorError
        self.dotColor = dotColor
        self.dotColorError = dotColorError
        self.captionTypography = captionTypography
        self.valueTypography = valueTypography
        self.size = size
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
