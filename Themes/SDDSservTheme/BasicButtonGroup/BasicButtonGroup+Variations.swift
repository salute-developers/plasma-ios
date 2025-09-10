import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.L> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LWide> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.LWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.M> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MWide> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.MWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.S> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SWide> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.SWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.Xs> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsWide> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XsWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.Xxs> {
    
    var dense: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsDense> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsNogap> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsWide> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.wide",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsDense> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.dense.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.dense.segmented",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsNogap> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.noGap.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.noGap.segmented",
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

public extension GeneralAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance, BasicButtonGroupVariation.XxsWide> {
    
    var `default`: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.wide.default",
            appearance: appearance
        )
    }
    
    var segmented: ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
        var size =  BasicButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xxs.wide.segmented",
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


public extension ComponentAppearanceVariation<BasicButtonGroup, BasicButtonGroupAppearance> {
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

private extension BasicButtonGroupAppearance {
    
}
