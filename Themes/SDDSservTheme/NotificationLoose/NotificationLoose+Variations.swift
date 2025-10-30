import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<NotificationLoose, NotificationAppearance, NotificationLooseVariation.L> {
    
    var l: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var size =  NotificationLooseAnySize(size: appearance.size)
        size.closeSize = CGFloat(24.0)
        size.paddingBottom = CGFloat(16.0)
        size.paddingEnd = CGFloat(16.0)
        size.paddingStart = CGFloat(16.0)
        size.paddingTop = CGFloat(16.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l",
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

public extension GeneralAppearanceVariation<NotificationLoose, NotificationAppearance, NotificationLooseVariation.M> {
    
    var m: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var size =  NotificationLooseAnySize(size: appearance.size)
        size.closeSize = CGFloat(16.0)
        size.paddingBottom = CGFloat(14.0)
        size.paddingEnd = CGFloat(14.0)
        size.paddingStart = CGFloat(14.0)
        size.paddingTop = CGFloat(14.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m",
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

public extension GeneralAppearanceVariation<NotificationLoose, NotificationAppearance, NotificationLooseVariation.S> {
    
    var s: ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
        var size =  NotificationLooseAnySize(size: appearance.size)
        size.closeSize = CGFloat(16.0)
        size.paddingBottom = CGFloat(12.0)
        size.paddingEnd = CGFloat(12.0)
        size.paddingStart = CGFloat(12.0)
        size.paddingTop = CGFloat(12.0)
        size.shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s",
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


public extension ComponentAppearanceVariation<NotificationLoose, NotificationAppearance> {
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

private extension NotificationAppearance {
    
}
