import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public struct SegmentItemAppearance: EnvironmentKey {
    public static let defaultValue: Self = .init()

    public var size: SegmentItemSizeConfiguration
    public var shapeStyle: ComponentShapeStyle
    public var titleTypography: TypographyConfiguration
    public var titleColor: ButtonColor
    public var subtitleTypography: TypographyConfiguration
    public var subtitleColor: ButtonColor
    public var iconColor: ButtonColor
    public var backgroundColor: ButtonColor
    public var disabledAlpha: CGFloat
    public var counterAppearance: CounterAppearance
    
    public init(
        size: SegmentItemSizeConfiguration = DefaultSegmentItemSize(),
        shapeStyle: ComponentShapeStyle = .cornered,
        titleTypography: TypographyConfiguration = .default,
        titleColor: ButtonColor = ButtonColor(),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: ButtonColor = ButtonColor(),
        iconColor: ButtonColor = ButtonColor(),
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
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
        self.counterAppearance = counterAppearance
    }
}
