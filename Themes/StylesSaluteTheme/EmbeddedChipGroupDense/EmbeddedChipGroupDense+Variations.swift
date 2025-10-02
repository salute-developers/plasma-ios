import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.L> {
    
    var l: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.L> {
        var size =  EmbeddedChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.M> {
    
    var m: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.M> {
        var size =  EmbeddedChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.S> {
    
    var s: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.S> {
        var size =  EmbeddedChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.Xs> {
    
    var xs: GeneralAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance, EmbeddedChipGroupDenseVariation.Xs> {
        var size =  EmbeddedChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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


public extension ComponentAppearanceVariation<EmbeddedChipGroupDense, ChipGroupAppearance> {
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
