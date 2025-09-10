import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.L> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LWide> {
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LDense> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.dense.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LNogap> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.noGap.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.LWide> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.wide.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.M> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MWide> {
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MDense> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.dense.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MNogap> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.noGap.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.MWide> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.wide.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.S> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SWide> {
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SDense> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.dense.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SNogap> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.noGap.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.SWide> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.wide.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.Xs> {
    
    var dense: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsDense> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(2.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense",
            appearance: appearance
        )
    }
    
    var noGap: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsNogap> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.spacing = CGFloat(0.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap",
            appearance: appearance
        )
    }
    
    var wide: GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsWide> {
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsDense> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.dense.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsNogap> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.noGap.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance, IconButtonGroupVariation.XsWide> {
    
    var `default`: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
        size.externalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
        size.internalShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xs.wide.default",
            appearance: appearance
        )
    }
    
    var pilled: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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
    
    var segmented: ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
        var size =  IconButtonGroupAnySize(size: appearance.size)
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


public extension ComponentAppearanceVariation<IconButtonGroup, IconButtonGroupAppearance> {
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

private extension IconButtonGroupAppearance {
    
}
