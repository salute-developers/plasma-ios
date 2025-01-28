import Foundation
import SDDSComponents
import SDDSServTheme

public extension AppearanceVariation<ChipAppearance> {
    var pilled: Self {
        .init(
            appearance: .init(
                size: appearance.size,
                titleColor: appearance.titleColor,
                titleTypography: appearance.titleTypography,
                imageTintColor: appearance.imageTintColor,
                buttonTintColor: appearance.buttonTintColor,
                backgroundColor: appearance.backgroundColor,
                shapeStyle: .pilled,
                disabledAlpha: appearance.disabledAlpha
            )
        )
    }
}
