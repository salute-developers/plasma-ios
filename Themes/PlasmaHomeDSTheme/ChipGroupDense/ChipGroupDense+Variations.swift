import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.L> {
    
    var l: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.L> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.LPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.LPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.LPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.l.pilled.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.M> {
    
    var m: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.M> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.MPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.MPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.MPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.m.pilled.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.S> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.SPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    
    var s: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.S> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.SPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.SPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.s.pilled.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.Xs> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XsPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    
    var xs: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.Xs> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XsPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XsPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
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
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xs.pilled.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.Xxs> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XxsPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var xxs: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.Xxs> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xxs.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xxs.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XxsPilled> {
    
    var pilled: GeneralAppearanceVariation<ChipGroupDense, ChipGroupAppearance, ChipGroupDenseVariation.XxsPilled> {
        var size =  ChipGroupDenseAnySize(size: appearance.size)
        size.alignment = ChipGroupAlignment.left
        size.insets(for: .dense)
        size.maxColumns = Int(0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.pilled",
            appearance: appearance
        )
    }
    
    var `default`: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xxs.pilled.default.appearance
        
        return .init(
            name: "`default`",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<ChipGroupAppearance> {
        var appearance = appearance
        appearance.chipAppearance = Chip.xxs.pilled.secondary.appearance
        
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
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<ChipGroupDense, ChipGroupAppearance> {
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
