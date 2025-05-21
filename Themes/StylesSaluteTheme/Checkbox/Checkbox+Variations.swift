import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore



public extension ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension CheckboxAppearance {
    
    var `default`: CheckboxAppearance {
        var appearance = self
        appearance.borderColor = ColorToken.outlineDefaultTransparentTertiary
        appearance.toggleColor = ColorToken.surfaceDefaultAccentMain
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
}
