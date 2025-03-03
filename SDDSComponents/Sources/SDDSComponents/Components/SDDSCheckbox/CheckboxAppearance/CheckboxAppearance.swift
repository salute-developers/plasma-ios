import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct CheckboxAppearance: SelectionControlAppearance, EnvironmentKey, Hashable {
    public static let defaultValue: Self = .init()
    
    let id = UUID()
    public var size: SelectionControlSizeConfiguration
    public var titleTypography: TypographyConfiguration
    public var subtitleTypography: TypographyConfiguration
    public var titleColor: ColorToken
    public var subtitleColor: ColorToken
    public var disabledAlpha: CGFloat
    public var imageTintColor: ColorToken?
    
    public init(
        size: SelectionControlSizeConfiguration = ZeroSelectionControlSize(),
        titleTypography: TypographyConfiguration = .default,
        subtitleTypography: TypographyConfiguration = .default,
        titleColor: ColorToken = .clearColor,
        subtitleColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0,
        imageTintColor: ColorToken? = nil) {
        self.size = size
        self.titleTypography = titleTypography
        self.subtitleTypography = subtitleTypography
        self.titleColor = titleColor
        self.subtitleColor = subtitleColor
        self.disabledAlpha = disabledAlpha
        self.imageTintColor = imageTintColor
    }
    
    public static func == (lhs: CheckboxAppearance, rhs: CheckboxAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
