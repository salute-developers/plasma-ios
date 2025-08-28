import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.L> {
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.M> {
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Checkbox, CheckboxAppearance, CheckboxVariation.S> {
    
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Checkbox, CheckboxAppearance> {
    var `default`: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<CheckboxAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
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
        appearance.toggleColor = ColorToken.surfaceDefaultAccent
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
    var negative: CheckboxAppearance {
        var appearance = self
        appearance.borderColor = ColorToken.outlineDefaultNegative
        appearance.toggleColor = ColorToken.surfaceDefaultNegative
        appearance.toggleColorChecked = ColorToken.textOnDarkPrimary
        appearance.toggleColorIndeterminate = ColorToken.textOnDarkPrimary
        return appearance
    }
    
}
