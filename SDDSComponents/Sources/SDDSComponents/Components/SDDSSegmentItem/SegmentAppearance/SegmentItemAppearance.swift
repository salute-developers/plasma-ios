import Foundation
@_exported import SDDSThemeCore

public struct SegmentItemAppearance {
    public let id = UUID()
    
    public let size: SegmentItemSizeConfiguration
    
    public let shapeStyle: ComponentShapeStyle
    
    public let titleTypography: TypographyConfiguration
    
    public let titleColor: ButtonColor
    
    public let subtitleTypography: TypographyConfiguration
    
    public let subtitleColor: ButtonColor
    
    public let iconColor: ButtonColor
    
    public let backgroundColor: ButtonColor
    
    public let disabledAlpha: CGFloat
    
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
    }
}
