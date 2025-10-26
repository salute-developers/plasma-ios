import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NoteAppearance` определяет внешний вид компонента Note.
 */
public struct NoteAppearance {
    public var backgroundColor: ColorToken
    public var iconColor: ColorToken
    public var closeColor: ColorToken
    public var titleColor: ColorToken
    public var textColor: ColorToken
    public var titleTypography: TypographyConfiguration
    public var textTypography: TypographyConfiguration
    public var closeIcon: Image?
    public var linkButtonAppearance: ButtonAppearance?
    public var size: NoteSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        iconColor: ColorToken = .clearColor,
        closeColor: ColorToken = .clearColor,
        titleColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        titleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        closeIcon: Image? = nil,
        linkButtonAppearance: ButtonAppearance? = nil,
        size: NoteSizeConfiguration = NoteSize()
    ) {
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
        self.closeColor = closeColor
        self.titleColor = titleColor
        self.textColor = textColor
        self.titleTypography = titleTypography
        self.textTypography = textTypography
        self.closeIcon = closeIcon
        self.linkButtonAppearance = linkButtonAppearance
        self.size = size
    }
}

// MARK: - Environment Key

extension NoteAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        NoteAppearance()
    }
}

public extension EnvironmentValues {
    var noteAppearance: NoteAppearance {
        get { self[NoteAppearance.self] }
        set { self[NoteAppearance.self] = newValue }
    }
}
