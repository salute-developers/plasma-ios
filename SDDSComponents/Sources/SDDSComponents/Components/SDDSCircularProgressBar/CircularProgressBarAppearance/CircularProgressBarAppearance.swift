import Foundation
import SwiftUI
import SDDSThemeCore

public struct CircularProgressBarAppearance: Hashable {
    let id = UUID()
    public var valueColor: ColorToken
    public var valueEnabled: Bool
    public var trackColor: ColorToken
    public var valueTypography: TypographyConfiguration
    public var indicatorColor: FillStyle
    public var size: CircularProgressBarSizeConfiguration
    
    public init(
        valueColor: ColorToken = .clearColor,
        valueEnabled: Bool = false,
        trackColor: ColorToken = .clearColor,
        valueTypography: TypographyConfiguration = .default,
        indicatorColor: FillStyle = .color(.clearColor),
        size: CircularProgressBarSizeConfiguration = ZeroCircularProgressBarSize()
    ) {
        self.valueColor = valueColor
        self.valueEnabled = valueEnabled
        self.trackColor = trackColor
        self.indicatorColor = indicatorColor
        self.valueTypography = valueTypography
        self.size = size
    }
    
    public static func == (lhs: CircularProgressBarAppearance, rhs: CircularProgressBarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.valueColor == rhs.valueColor &&
        lhs.valueEnabled == rhs.valueEnabled &&
        lhs.trackColor == rhs.trackColor &&
        lhs.indicatorColor == rhs.indicatorColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension CircularProgressBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: CircularProgressBarAppearance.self, fallback: CircularProgressBarAppearance())
    }
}
