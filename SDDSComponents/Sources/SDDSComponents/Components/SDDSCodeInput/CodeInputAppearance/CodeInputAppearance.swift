import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `CodeInputAppearance` определяет внешний вид компонента CodeInput.
 */
public struct CodeInputAppearance {
    public var codeColor: ColorToken
    public var codeColorError: ColorToken
    public var captionColor: ColorToken
    public var captionColorError: ColorToken
    public var strokeColor: ColorToken
    public var strokeColorError: ColorToken
    public var strokeColorFocused: ColorToken
    public var fillColor: ColorToken
    public var fillColorError: ColorToken
    public var codeTypography: TypographyConfiguration
    public var captionTypography: TypographyConfiguration
    public var size: CodeInputSizeConfiguration
    
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
        self.codeColor = codeColor
        self.codeColorError = codeColorError
        self.captionColor = captionColor
        self.captionColorError = captionColorError
        self.strokeColor = strokeColor
        self.strokeColorError = strokeColorError
        self.strokeColorFocused = strokeColorFocused
        self.fillColor = fillColor
        self.fillColorError = fillColorError
        self.codeTypography = codeTypography
        self.captionTypography = captionTypography
        self.size = size
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
