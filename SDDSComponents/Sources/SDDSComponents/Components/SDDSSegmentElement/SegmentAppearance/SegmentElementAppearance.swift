import Foundation
@_exported import SDDSThemeCore

public struct SegmentElementAppearance {
    public let size: SegmentElementSizeConfiguration
    
    public let shapeStyle: SegmentElementShapeStyle
    
    public let titleTypography: TypographyConfiguration
    
    public let titleColor: SegmentElementColor
    
    public let subtitleTypography: TypographyConfiguration
    
    public let subtitleColor: SegmentElementColor
    
    public let iconColor: SegmentElementColor
    
    public let backgroundColor: SegmentElementColor
    
    public let disabledAlpha: CGFloat
    
    public init(
        size: SegmentElementSizeConfiguration = DefaultSegmentElementSize(),
        shapeStyle: SegmentElementShapeStyle = .pilled,
        titleTypography: TypographyConfiguration = .default,
        titleColor: SegmentElementColor = SegmentElementColor(),
        subtitleTypography: TypographyConfiguration = .default,
        subtitleColor: SegmentElementColor = SegmentElementColor(),
        iconColor: SegmentElementColor = SegmentElementColor(),
        backgroundColor: SegmentElementColor = SegmentElementColor(),
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
