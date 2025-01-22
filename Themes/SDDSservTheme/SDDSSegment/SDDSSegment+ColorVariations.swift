import Foundation
import SDDSComponents
import SDDSThemeCore

public struct SegmentAppearanceVariation: Hashable {
    public let name: String
    public let appearance: SegmentAppearance
    
    public init(name: String = "", appearance: SegmentAppearance = SegmentAppearance()) {
        self.name = name
        self.appearance = appearance
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
    
    public static func == (lhs: SegmentAppearanceVariation, rhs: SegmentAppearanceVariation) -> Bool {
        return lhs.name == rhs.name
    }
}


public extension SegmentAppearanceVariation {
    var `default`: Self {
        .init(
            appearance: appearance.applyColorVariation(variation: SDDSSegment.default.appearance)
        )
    }
}


public extension SDDSSegment {
    static var `default`: SegmentAppearanceVariation {
        .init(
            name: "default",
            appearance: SegmentAppearance(
                backgroundColor: ButtonColor(
                    defaultColor: .backgroundDefaultPrimary,
                    highlightedColor: .backgroundDefaultPrimary,
                    hoveredColor: .backgroundDefaultPrimary
                )
            )
        )
    }
    
    static var all: [SegmentAppearanceVariation] {
        [
            SDDSSegment.default
        ]
    }
}
