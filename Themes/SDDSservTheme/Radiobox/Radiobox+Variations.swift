import Foundation
import SDDSComponents

public extension ComponentAppearanceVariation<Radiobox, RadioboxAppearance> {
    var `default`: AppearanceVariation<RadioboxAppearance> {
        var appearance = Radiobox.default.appearance
        appearance.size = self.appearance.size
        return .init(name: "default", appearance: appearance)
    }
    
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`
            ],
            name: name,
            appearance: appearance
        )
    }
}

extension Radiobox {
    static var `default`: AppearanceVariation<RadioboxAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    color: .surfaceDefaultAccent,
                    borderColor: .outlineDefaultTransparentTertiary,
                    checkedIcon: CircleDrawer(),
                    checkedIconColor: .textOnDarkPrimary,
                    titleTypography: RadioboxTypography.label,
                    subtitleTypography: RadioboxTypography.description,
                    titleColor: .backgroundInversePrimary,
                    subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
                    disabledAlpha: 0.4
                )
        )
    }
}
