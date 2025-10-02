import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<NotificationCompact, NotificationAppearance, NotificationCompactVariation.L> {
    
    var l: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var size =  NotificationCompactAnySize(size: appearance.size)
        size.closeSize = CGFloat(24.0)
        size.paddingBottom = CGFloat(8.0)
        size.paddingEnd = CGFloat(8.0)
        size.paddingStart = CGFloat(8.0)
        size.paddingTop = CGFloat(8.0)
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

public extension GeneralAppearanceVariation<NotificationCompact, NotificationAppearance, NotificationCompactVariation.M> {
    
    var m: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var size =  NotificationCompactAnySize(size: appearance.size)
        size.closeSize = CGFloat(16.0)
        size.paddingBottom = CGFloat(6.0)
        size.paddingEnd = CGFloat(6.0)
        size.paddingStart = CGFloat(6.0)
        size.paddingTop = CGFloat(6.0)
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

public extension GeneralAppearanceVariation<NotificationCompact, NotificationAppearance, NotificationCompactVariation.S> {
    
    var s: ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
        var size =  NotificationCompactAnySize(size: appearance.size)
        size.closeSize = CGFloat(16.0)
        size.paddingBottom = CGFloat(4.0)
        size.paddingEnd = CGFloat(4.0)
        size.paddingStart = CGFloat(4.0)
        size.paddingTop = CGFloat(4.0)
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


public extension ComponentAppearanceVariation<NotificationCompact, NotificationAppearance> {
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
