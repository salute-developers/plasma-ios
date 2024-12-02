import Foundation
import SDDSComponents

public extension ButtonAppearanceVariation<SegmentElement> {
    var pilled: Self {
        .init(
            appearance: appearance.shapeStyle(.pilled)
        )
    }
}

public extension SegmentElement {
    static var pilled: ButtonAppearanceVariation<SegmentElement> {
        .init(
            appearance: ButtonAppearance().shapeStyle(.pilled)
        )
    }
}
