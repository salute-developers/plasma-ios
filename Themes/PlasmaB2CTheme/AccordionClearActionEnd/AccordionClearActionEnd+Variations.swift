import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons


public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.H2> {
    
    var h2: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(16.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h2.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.H3> {
    
    var h3: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(14.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h3.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.H4> {
    
    var h4: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(12.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h4.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.H5> {
    
    var h5: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h5.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.L> {
    
    var l: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(10.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.l.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.M> {
    
    var m: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(8.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.m.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.S> {
    
    var s: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(6.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.s.appearance
    
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

public extension GeneralAppearanceVariation<AccordionClearActionEnd, AccordionAppearance, AccordionClearActionEndVariation.Xs> {
    
    var xs: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var size =  AccordionClearActionEndAnySize(size: appearance.size)
        size.itemSpacing = CGFloat(4.0)

        var appearance = appearance
        appearance.size = size
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.xs.appearance
    
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


public extension ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
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
