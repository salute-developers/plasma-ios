import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct TooltipAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var textColor: ColorToken
    public var contentStartColor: ColorToken
    public var shadow: ShadowToken
    public var size: TooltipSizeConfiguration
    public var textTypography: TypographyConfiguration?
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        contentStartColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        size: TooltipSizeConfiguration = ZeroTooltipSize(),
        textTypography: TypographyConfiguration? = nil
    ) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.contentStartColor = contentStartColor
        self.shadow = shadow
        self.size = size
        self.textTypography = textTypography
    }
    
    public static func == (lhs: TooltipAppearance, rhs: TooltipAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 
