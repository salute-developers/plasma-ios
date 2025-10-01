import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h2.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h3.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h4.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h5.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.l.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.m.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.s.appearance
    
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

public extension GeneralAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance, AccordionSolidActionEndVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var size =  AccordionSolidActionEndAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.xs.appearance
    
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


public extension ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
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
