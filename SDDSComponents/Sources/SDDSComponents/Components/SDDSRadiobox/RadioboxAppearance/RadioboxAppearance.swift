import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance, Hashable {
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
    
    public static func == (lhs: RadioboxAppearance, rhs: RadioboxAppearance) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension RadioboxAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: RadioboxAppearance.self, fallback: RadioboxAppearance())
    }
}
