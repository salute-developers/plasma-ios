import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

public extension ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
    var `default`: AppearanceVariation<CheckboxAppearance> {
        var appearance = Checkbox.default.appearance
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

extension Checkbox {
    static var `default`: AppearanceVariation<CheckboxAppearance> {
        .init(
            name: "default",
            appearance:
                .init(
                    titleTypography: CheckboxTypography.label,
                    subtitleTypography: CheckboxTypography.description,
                    titleColor: .backgroundInversePrimary,
                    subtitleColor: .surfaceInverseSolidPrimary.withOpacity(0.56),
                    disabledAlpha: 0.4
                )
        )
    }
}
