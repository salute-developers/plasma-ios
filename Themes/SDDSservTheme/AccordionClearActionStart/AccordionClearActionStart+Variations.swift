import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h2.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h3.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h4.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h5.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.l.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.m.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.s.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionStart, AccordionAppearance, AccordionClearActionStartVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var size =  AccordionClearActionStartAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionStart.xs.appearance
    
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


public extension ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
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
