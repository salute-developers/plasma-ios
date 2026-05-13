import SwiftUI
import Foundation
import SDDSThemeCore

public struct BadgeAppearance {
    public var size: BadgeSizeConfiguration = DefaultBadgeSize()
    public var backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    public var startContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    public var endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    public var labelColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    public var labelTypography: TypographyConfiguration = .default

    public init() {}

    @available(*, deprecated, message: "Use StatefulFillStyle properties to support gradients.")
    public init(
        size: BadgeSizeConfiguration,
        backgroundColor: StatefulColor,
        startContentColor: StatefulColor,
        endContentColor: StatefulColor,
        labelColor: StatefulColor,
        labelTypography: TypographyConfiguration = .default
    ) {
        self.size = size
        self.backgroundColor = backgroundColor.statefulFillStyle
        self.startContentColor = startContentColor.statefulFillStyle
        self.endContentColor = endContentColor.statefulFillStyle
        self.labelColor = labelColor.statefulFillStyle
        self.labelTypography = labelTypography
    }
}

extension BadgeAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: BadgeAppearance.self, fallback: BadgeAppearance())
    }
}
