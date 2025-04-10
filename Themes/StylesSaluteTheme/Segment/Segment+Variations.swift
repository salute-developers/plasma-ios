import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.L> {
    
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
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.LPilled> {
    
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
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.M> {
    
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
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.MPilled> {
    
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
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.SPilled> {
    
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
                self.primary,
                self.secondary,
            ],
            name: name,
            appearance: appearance
        )
    }
    
}

public extension GeneralAppearanceVariation<Segment, SegmentAppearance, SegmentVariation.XsPilled> {
    
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
