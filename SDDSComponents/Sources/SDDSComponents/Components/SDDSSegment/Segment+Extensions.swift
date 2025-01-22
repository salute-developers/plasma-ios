import Foundation

public extension SegmentAppearance {
    func size(_ size: SegmentSizeConfiguration) -> SegmentAppearance {
        return SegmentAppearance(
            size: size,
            stretch: self.stretch,
            hasBackground: self.hasBackground,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func hasBackground(_ hasBackground: Bool) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            stretch: self.stretch,
            hasBackground: hasBackground,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            disabledAlpha: self.disabledAlpha
        )
    }

    func backgroundColor(_ backgroundColor: ButtonColor?) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            stretch: self.stretch,
            hasBackground: self.hasBackground,
            backgroundColor: backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            disabledAlpha: self.disabledAlpha
        )
    }

    func segmentItemAppearance(_ segmentItemAppearance: SegmentItemAppearance) -> SegmentAppearance {
        return SegmentAppearance(
            size: self.size,
            stretch: self.stretch,
            hasBackground: self.hasBackground,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: segmentItemAppearance,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func stretch(_ stretch: Bool) -> SegmentAppearance {
        SegmentAppearance(
            size: self.size,
            stretch: stretch,
            hasBackground: self.hasBackground,
            backgroundColor: self.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            disabledAlpha: self.disabledAlpha
        )
    }
    
    func applyColorVariation(variation: SegmentAppearance) -> SegmentAppearance {
        SegmentAppearance(
            size: self.size,
            stretch: self.stretch,
            hasBackground: self.hasBackground,
            backgroundColor: variation.backgroundColor,
            segmentItemAppearance: self.segmentItemAppearance,
            disabledAlpha: variation.disabledAlpha
        )
    }
}
