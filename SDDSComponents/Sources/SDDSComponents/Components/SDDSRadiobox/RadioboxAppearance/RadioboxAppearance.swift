import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct RadioboxAppearance: SelectionControlAppearance, Hashable {
    let id = UUID()
    public let size: SelectionControlSizeConfiguration
    public let titleTypography: TypographyConfiguration
    public let subtitleTypography: TypographyConfiguration
    public let titleColor: ColorToken
    public let subtitleColor: ColorToken
    public let disabledAlpha: CGFloat
    public let imageTintColor: ColorToken?
    
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
