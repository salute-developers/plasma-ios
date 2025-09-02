import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `CodeFieldAppearance` определяет внешний вид компонента CodeField.
 */
public struct CodeFieldAppearance {
    public var valueColor: ColorToken
    public var valueColorError: ColorToken
    public var backgroundColor: ColorToken
    public var backgroundColorActivated: ColorToken
    public var backgroundColorError: ColorToken
    public var cursorColor: ColorToken
    public var captionColor: ColorToken
    public var captionColorError: ColorToken
    public var dotColor: ColorToken
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
