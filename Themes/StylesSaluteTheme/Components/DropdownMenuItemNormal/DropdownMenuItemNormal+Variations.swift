import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.L> {
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.M> {
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.S> {
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.Xl> {
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance, DropdownMenuItemNormalVariation.Xs> {
    
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<DropdownMenuItemNormal, ListItemAppearance> {
    var `default`: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "`default`",
            appearance: appearance.`default`
        )
    }
    var negative: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "negative",
            appearance: appearance.negative
        )
    }
    var positive: AppearanceVariation<ListItemAppearance> {
        return .init(
            name: "positive",
            appearance: appearance.positive
        )
    }
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.negative,
                self.positive,
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ListItemAppearance {
    
    var `default`: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultPrimary
        return appearance
    }
    
    var negative: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultNegative
        return appearance
    }
    
    var positive: ListItemAppearance {
        var appearance = self
        appearance.titleColor = ColorToken.textDefaultPositive
        return appearance
    }
    
}
