import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.M> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
        size.dotWidth = CGFloat(12.0)
        size.dotWidthActivated = CGFloat(48.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.activeTypeLine",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.M> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.MActivetypeline> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
        size.dotWidth = CGFloat(12.0)
        size.dotWidthActivated = CGFloat(48.0)

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

public extension GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.S> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
        size.dotWidth = CGFloat(8.0)
        size.dotWidthActivated = CGFloat(32.0)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.activeTypeLine",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.S> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
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

public extension GeneralAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance, PaginationDotsHorizontalVariation.SActivetypeline> {
    
    var activeTypeLine: ComponentAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance> {
        var size =  PaginationDotsHorizontalAnySize(size: appearance.size)
        size.dotWidth = CGFloat(8.0)
        size.dotWidthActivated = CGFloat(32.0)

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


public extension ComponentAppearanceVariation<PaginationDotsHorizontal, PaginationDotsAppearance> {
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
