import Foundation
import SDDSComponents

public extension ComponentAppearanceVariation<IconButton, ButtonAppearance> {
    var pilled: Self {
        .init(
            appearance: appearance.shapeStyle(.pilled)
        )
    }
}

public extension IconButton {
    static var pilled: ComponentAppearanceVariation<IconButton, ButtonAppearance> {
        .init(
            appearance: ButtonAppearance().shapeStyle(.pilled)
        )
    }
}
