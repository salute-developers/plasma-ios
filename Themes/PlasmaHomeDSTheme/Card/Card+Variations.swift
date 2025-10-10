import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore


public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.L> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.hasInnerPaddings",
            appearance: appearance
        )
    }
    
    var l: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.L> {
        var size =  CardAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.LHasinnerpaddings> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "l.hasInnerPaddings",
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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.M> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.hasInnerPaddings",
            appearance: appearance
        )
    }
    
    var m: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.M> {
        var size =  CardAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.MHasinnerpaddings> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "m.hasInnerPaddings",
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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.S> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.hasInnerPaddings",
            appearance: appearance
        )
    }
    
    var s: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.S> {
        var size =  CardAnySize(size: appearance.size)

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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.SHasinnerpaddings> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "s.hasInnerPaddings",
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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.Xl> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl.hasInnerPaddings",
            appearance: appearance
        )
    }
    
    var xl: GeneralAppearanceVariation<Card, CardAppearance, CardVariation.Xl> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl",
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

public extension GeneralAppearanceVariation<Card, CardAppearance, CardVariation.XlHasinnerpaddings> {
    
    var hasInnerPaddings: ComponentAppearanceVariation<Card, CardAppearance> {
        var size =  CardAnySize(size: appearance.size)

        var appearance = appearance
        appearance.size = size
    
        return .init(
            name: "xl.hasInnerPaddings",
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


public extension ComponentAppearanceVariation<Card, CardAppearance> {
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

private extension CardAppearance {
    
}
