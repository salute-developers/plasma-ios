import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.L> {
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.l.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.M> {
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.m.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.S> {
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.s.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.s.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.s.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance, EmbeddedChipGroupWideVariation.Xs> {
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.xs.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.xs.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = EmbeddedChip.xs.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<EmbeddedChipGroupWide, ChipGroupAppearance> {
    var variation: Variation<Appearance> {
        .init(
            originalVariation: self,
            styles: [
            ],
            name: name,
            appearance: appearance
        )
    }
}

private extension ChipGroupAppearance {
    
}
