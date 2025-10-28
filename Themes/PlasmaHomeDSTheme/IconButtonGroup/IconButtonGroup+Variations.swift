import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.L> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.L> {
        var size =  IconButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = IconButton.l.default.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LDense> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LDensePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LNogap> {
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LNogapPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LWide> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LWidePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.LWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.M> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.M> {
        var size =  IconButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = IconButton.m.default.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MDense> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MDensePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MNogap> {
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MNogapPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MWide> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MWidePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.MWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.S> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.S> {
        var size =  IconButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = IconButton.s.default.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SDense> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SDensePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SNogap> {
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SNogapPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SWide> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SWidePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.SWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.Xs> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.Xs> {
        var size =  IconButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = IconButton.xs.default.appearance
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsDense> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsDensePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsNogap> {
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsNogapPilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.segmented",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsWide> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.pilled",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsWide> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsWidePilled> {
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CircleDrawer() as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.pilled",
            appearance: appearance
        )
    }
    
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

public extension GeneralAppearanceVariation<IconButtonGroup, ButtonGroupAppearance, IconButtonGroupVariation.XsWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CircleDrawer() as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.segmented",
            appearance: appearance
        )
    }
    
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


public extension ComponentAppearanceVariation<IconButtonGroup, ButtonGroupAppearance> {
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

private extension ButtonGroupAppearance {
    
}
