import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentItemAppearance {
    public var size: SegmentItemSizeConfiguration
    public var shapeStyle: ComponentShapeStyle
    public var titleTypography: TypographyConfiguration
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var titleColor: ButtonColor
    public var subtitleTypography: TypographyConfiguration
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var subtitleColor: ButtonColor
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var iconColor: ButtonColor
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var startContentColor: ButtonColor
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var endContentColor: ButtonColor
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var backgroundColor: ButtonColor
    public var disabledAlpha: CGFloat
    public var counterAppearance: CounterAppearance
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public init(
        size: SegmentItemSizeConfiguration = DefaultSegmentItemSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor = ButtonColor(),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ButtonColor = ButtonColor(),
        iconColor: ButtonColor = ButtonColor(),
        startContentColor: ButtonColor = ButtonColor(),
        endContentColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
        counterAppearance: CounterAppearance = CounterAppearance(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.subtitleTypography = subtitleTypography
        self.subtitleColor = subtitleColor
        self.iconColor = iconColor
        self.startContentColor = startContentColor
        self.endContentColor = endContentColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.counterAppearance = counterAppearance
    }
    
    public init(
        size: SegmentItemSizeConfiguration = DefaultSegmentItemSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor = ButtonColor(),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ButtonColor = ButtonColor(),
        startContentColor: ButtonColor = ButtonColor(),
        endContentColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
        counterAppearance: CounterAppearance = CounterAppearance(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.shapeStyle = shapeStyle
        self.titleTypography = titleTypography
        self.titleColor = titleColor
        self.subtitleTypography = subtitleTypography
        self.subtitleColor = subtitleColor
        self.startContentColor = startContentColor
        self.endContentColor = endContentColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.counterAppearance = counterAppearance
        self.iconColor = ButtonColor()
    }

    
}

extension SegmentItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SegmentItemAppearance.self, fallback: SegmentItemAppearance())
    }
}
