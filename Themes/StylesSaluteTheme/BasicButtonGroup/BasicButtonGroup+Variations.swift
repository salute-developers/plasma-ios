import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.L> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.L> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.l.default.appearance
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.default",
            appearance: appearance
        )
    }
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LDenseDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.default",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LNogapDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LWideDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.LWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.M> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.M> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.m.default.appearance
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.default",
            appearance: appearance
        )
    }
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MDenseDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.default",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MNogapDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MWideDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.MWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.S> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.S> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.s.default.appearance
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.default",
            appearance: appearance
        )
    }
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SDenseDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.default",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SNogapDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SWideDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.SWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.Xs> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.Xs> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.buttonAppearance = BasicButton.xs.default.appearance
    
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.default",
            appearance: appearance
        )
    }
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsDenseDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsDenseSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.default",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsNogapDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsNogapSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.segmented",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsWideDefault> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.default",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance, BasicButtonGroupVariation.XsWideSegmented> {
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
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


public extension ComponentAppearanceVariation<BasicButtonGroup, ButtonGroupAppearance> {
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
