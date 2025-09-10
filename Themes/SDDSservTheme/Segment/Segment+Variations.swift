import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.L> {
    
    var l: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.L> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "l",
            appearance: appearance
        )
    }
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.LPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.LPilled> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.LPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "l.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.pilled.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.l.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.M> {
    
    var m: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.M> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "m",
            appearance: appearance
        )
    }
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.MPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.MPilled> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.MPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "m.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.pilled.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.m.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.S> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.SPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.S> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "s",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.SPilled> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.SPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "s.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.pilled.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.s.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xl> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XlPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
    var xl: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xl> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius-2.0) as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xl",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XlPilled> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XlPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xl.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.pilled.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xl.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xs> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XsPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var xs: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.Xs> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
        size.pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XsPilled> {
    
    var pilled: GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XsPilled> {
        var size =  SegmentAnySize(size: appearance.size)
        size.horizontalHeight = CGFloat(0)
        size.paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
        size.pathDrawer = CircleDrawer() as PathDrawer
        size.verticalWidth = CGFloat(0)

        var appearance = appearance
        appearance.size = size
        appearance.disabledAlpha = CGFloat(0)
    
        return .init(
            name: "xs.pilled",
            appearance: appearance
        )
    }
    
    var accent: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.pilled.accent.appearance
        
        return .init(
            name: "accent",
            appearance: appearance
        )
    }
    var primary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.pilled.primary.appearance
        
        return .init(
            name: "primary",
            appearance: appearance
        )
    }
    var secondary: AppearanceVariation<SegmentAppearance> {
        var appearance = appearance
        appearance.disabledAlpha = CGFloat(0)
        appearance.segmentItemAppearance = SegmentItem.xs.pilled.secondary.appearance
        
        return .init(
            name: "secondary",
            appearance: appearance
        )
    }
    var variation: Variation<SegmentAppearance> {
        .init(
            originalVariation: self,
            styles: [
                self.accent,
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}


public extension ComponentAppearanceVariation<Segment, SegmentAppearance> {
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

private extension SegmentAppearance {
    
}
