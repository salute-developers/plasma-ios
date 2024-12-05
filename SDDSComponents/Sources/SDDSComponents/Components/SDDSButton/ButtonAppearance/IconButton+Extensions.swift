import Foundation
import SDDSComponents

public extension ButtonAppearanceVariation<IconButton> {
    var pilled: Self {
        .init(
            appearance: appearance.shapeStyle(.pilled)
        )
    }
}

public extension IconButton {
    static var pilled: ButtonAppearanceVariation<IconButton> {
        .init(
            appearance: ButtonAppearance().shapeStyle(.pilled)
        )
    }
}
