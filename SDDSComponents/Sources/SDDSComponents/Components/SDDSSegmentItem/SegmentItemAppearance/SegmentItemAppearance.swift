import Foundation
import SwiftUI
import SDDSThemeCore

public struct SegmentItemAppearance {
    public var size: SegmentItemSizeConfiguration
    public var shapeStyle: ComponentShapeStyle
    public var titleTypography: TypographyConfiguration
    public var titleColor: ButtonColor
    public var subtitleTypography: TypographyConfiguration
    public var subtitleColor: ButtonColor
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public var iconColor: ButtonColor
    public var startContentColor: ButtonColor
    public var endContentColor: ButtonColor
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
