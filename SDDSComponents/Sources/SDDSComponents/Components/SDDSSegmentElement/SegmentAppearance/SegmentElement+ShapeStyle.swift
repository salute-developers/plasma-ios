import Foundation
import SDDSComponents

public extension SegmentElementAppearanceVariation {
    var pilled: Self {
        .init(
            appearance: appearance.shapeStyle(.pilled)
        )
    }
}

public extension SDDSSegmentElement {
    static var pilled: SegmentElementAppearanceVariation {
        .init(
            appearance: SegmentElementAppearance().shapeStyle(.pilled)
        )
    }
}
