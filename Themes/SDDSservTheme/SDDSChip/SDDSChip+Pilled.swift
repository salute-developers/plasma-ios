import Foundation
import SDDSComponents
import SDDSServTheme

public extension AppearanceVariation<ChipAppearance> {
    var pilled: Self {
        .init(
            appearance: .init(
                size: (appearance.size as? SDDSChipSize)?.pilled ?? .extraSmall(.pilled),
                titleColor: appearance.titleColor,
                titleTypography: appearance.titleTypography,
                imageTintColor: appearance.imageTintColor,
                buttonTintColor: appearance.buttonTintColor,
                backgroundColor: appearance.backgroundColor,
                disabledAlpha: appearance.disabledAlpha
            )
        )
    }
}
