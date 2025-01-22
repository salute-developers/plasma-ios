import Foundation
import SDDSComponents
import SDDSThemeCore

public extension AppearanceVariation<SegmentAppearance> {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegment.default.appearance)
        )
    }
}

public extension SDDSSegment {
    static var `default`: AppearanceVariation<SegmentAppearance> {
        .init(
            name: "default",
            appearance: .init(
                backgroundColor: ButtonColor(
                    defaultColor: .backgroundDefaultPrimary,
                    highlightedColor: .backgroundDefaultPrimary,
                    hoveredColor: .backgroundDefaultPrimary
                ),
                disabledAlpha: 0.4
            )
        )
    }
    
    static var all: [AppearanceVariation<SegmentAppearance>] {
        [
            SDDSSegment.default
        ]
    }
}
