import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

@ApiInfo
public struct SegmentItemAppearance {
    public var size: SegmentItemSizeConfiguration
    @ApiIgnore
    public var shapeStyle: ComponentShapeStyle
    @ApiName("labelStyle")
    public var titleTypography: TypographyConfiguration
    @ApiName("labelColor")
    public var titleColor: StatefulFillStyle
    @ApiName("valueStyle")
    public var subtitleTypography: TypographyConfiguration
    @ApiName("valueColor")
    public var subtitleColor: StatefulFillStyle
    public var iconColor: StatefulFillStyle
    @ApiName("startContentColor")
    public var startContentColor: StatefulFillStyle
    @ApiName("endContentColor")
    public var endContentColor: StatefulFillStyle
    @ApiName("backgroundColor")
    public var backgroundColor: StatefulFillStyle
    public var disabledAlpha: CGFloat
    public var counterAppearance: CounterAppearance

    @available(*, deprecated, message: "Don't use it, public method will be removed")
    public init(
        size: SegmentItemSizeConfiguration = DefaultSegmentItemSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        iconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        startContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
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
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        startContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        endContentColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
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
        self.iconColor = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    }

    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
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
        self.init(
            size: size,
            shapeStyle: shapeStyle,
            titleTypography: titleTypography,
            titleColor: titleColor.statefulColor.statefulFillStyle,
            subtitleTypography: subtitleTypography,
            subtitleColor: subtitleColor.statefulColor.statefulFillStyle,
            startContentColor: startContentColor.statefulColor.statefulFillStyle,
            endContentColor: endContentColor.statefulColor.statefulFillStyle,
            backgroundColor: backgroundColor.statefulColor.statefulFillStyle,
            counterAppearance: counterAppearance,
            disabledAlpha: disabledAlpha
        )
    }
}

extension SegmentItemAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SegmentItemAppearance.self, fallback: SegmentItemAppearance())
    }
}
