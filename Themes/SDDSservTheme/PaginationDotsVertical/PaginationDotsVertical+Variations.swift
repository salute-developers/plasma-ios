import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.M> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(12.0)
        size.dotHeightActivated = CGFloat(48.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.activeTypeLine",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.M> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(12.0)
        size.dotHeightActivated = CGFloat(12.0)
        size.dotWidth = CGFloat(12.0)
        size.dotWidthActivated = CGFloat(12.0)
        size.edgeCount = Int(2)

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

public extension GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.MActivetypeline> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(12.0)
        size.dotHeightActivated = CGFloat(48.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.activeTypeLine",
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

public extension GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.S> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(8.0)
        size.dotHeightActivated = CGFloat(32.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.activeTypeLine",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.S> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(8.0)
        size.dotHeightActivated = CGFloat(8.0)
        size.dotWidth = CGFloat(8.0)
        size.dotWidthActivated = CGFloat(8.0)
        size.edgeCount = Int(1)

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

public extension GeneralAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance, PaginationDotsVerticalVariation.SActivetypeline> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance> {
        var size =  PaginationDotsVerticalAnySize(size: appearance.size)
        size.dotHeight = CGFloat(8.0)
        size.dotHeightActivated = CGFloat(32.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.activeTypeLine",
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


public extension ComponentAppearanceVariation<PaginationDotsVertical, PaginationDotsAppearance> {
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

private extension PaginationDotsAppearance {
    
}
