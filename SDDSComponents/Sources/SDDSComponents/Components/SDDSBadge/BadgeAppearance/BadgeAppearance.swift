import SwiftUI
import Foundation
import SDDSThemeCore

public struct BadgeAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()
    
    public var size: BadgeSizeConfiguration = DefaultBadgeSize()
    public var backgroundColor: ColorToken = .clearColor
    public var startContentColor: ColorToken = .clearColor
    public var endContentColor: ColorToken = .clearColor
    public var labelColor: ColorToken = .clearColor
    public var labelTypography: TypographyConfiguration = .default
    
    public init() {}
}
