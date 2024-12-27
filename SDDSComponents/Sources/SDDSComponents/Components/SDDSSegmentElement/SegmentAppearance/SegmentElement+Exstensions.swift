import Foundation

extension SDDSSegmentElement {
    var size: ButtonSizeConfiguration {
        SegmentElementSizeToButtonSizeConfigurationMapper(
            height: appearance.size.height,
            cornerRadius: appearance.size.cornerRadius,
            paddings: appearance.size.paddings,
            iconSize: appearance.size.iconSize,
            iconHorizontalGap: appearance.size.iconHorizontalGap,
            titleHorizontalGap: appearance.size.titleHorizontalGap)
        as ButtonSizeConfiguration
    }
    var titleColor: ButtonColor {
        return ButtonColor(
            defaultColor: appearance.titleColor.defaultColor,
            highlightedColor: appearance.titleColor.highlightedColor,
            hoveredColor: appearance.titleColor.hoveredColor
        )
    }
    var subtitleColor: ButtonColor {
        return ButtonColor(
            defaultColor: appearance.subtitleColor.defaultColor,
            highlightedColor: appearance.subtitleColor.highlightedColor,
            hoveredColor: appearance.subtitleColor.hoveredColor
        )
    }
    var iconColor: ButtonColor {
        return ButtonColor(
            defaultColor: appearance.iconColor.defaultColor,
            highlightedColor: appearance.iconColor.highlightedColor,
            hoveredColor: appearance.iconColor.hoveredColor
        )
    }
    var backgroundColor: ButtonColor {
        return ButtonColor(
            defaultColor: appearance.backgroundColor.defaultColor,
            highlightedColor: appearance.backgroundColor.highlightedColor,
            hoveredColor: appearance.backgroundColor.hoveredColor
        )
    }
}
