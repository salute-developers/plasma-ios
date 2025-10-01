import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.L> {
    
    var l: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.L> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
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
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.LPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.LPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.LPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.M> {
    
    var m: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.M> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
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
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.MPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.MPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.MPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.S> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.SPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.S> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
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
        appearance.chipAppearance = Chip.s.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.SPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.SPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.Xs> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.XsPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.Xs> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
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
        appearance.chipAppearance = Chip.xs.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.XsPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupWide, ChipGroupAppearance, ChipGroupWideVariation.XsPilled> {
        var size =  ChipGroupWideAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var accent: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var negative: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.negative.appearance
        
        return .init(
            name: "negative",
            appearance: appearance
        )
    }
    var positive: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.positive.appearance
        
        return .init(
            name: "positive",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var warning: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.warning.appearance
        
        return .init(
            name: "warning",
            appearance: appearance
        )
    }
    var variation: Variation<ChipGroupAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.`default`,
                self.accent,
                self.negative,
                self.positive,
                self.secondary,
                self.warning,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<ChipGroupWide, ChipGroupAppearance> {
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
