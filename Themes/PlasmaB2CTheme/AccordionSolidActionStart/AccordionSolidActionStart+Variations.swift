import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h2.appearance
    
        return .init(
            name: "h2",
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h3.appearance
    
        return .init(
            name: "h3",
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h4.appearance
    
        return .init(
            name: "h4",
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h5.appearance
    
        return .init(
            name: "h5",
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.l.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.m.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.s.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionStart, AccordionAppearance, AccordionSolidActionStartVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var size =  AccordionSolidActionStartAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.xs.appearance
    
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


public extension ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
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

private extension AccordionAppearance {
    
}
