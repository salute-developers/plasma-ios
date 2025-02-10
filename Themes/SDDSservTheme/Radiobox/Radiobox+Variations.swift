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
                    titleTypography: RadioboxTypography.label,
                    subtitleTypography: RadioboxTypography.description,
                    titleColor: .textDefaultPrimary,
                    subtitleColor: .textDefaultSecondary,
                    disabledAlpha: 0.4
                )
        )
    }
}
