import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionClearActionEnd {
    public static var h2: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.h2
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h2.appearance

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.h3
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h3.appearance

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.h4
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h4.appearance

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.h5
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.h5.appearance

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.l
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.m
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.s
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionClearActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionEndSize.xs
        appearance.accordionItemAppearance = AccordionItemClearActionEnd.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionAppearance>] = [
        AccordionClearActionEnd.h2.variation,
        AccordionClearActionEnd.h3.variation,
        AccordionClearActionEnd.h4.variation,
        AccordionClearActionEnd.h5.variation,
        AccordionClearActionEnd.l.variation,
        AccordionClearActionEnd.m.variation,
        AccordionClearActionEnd.s.variation,
        AccordionClearActionEnd.xs.variation,
    ]
}

public struct AccordionClearActionEndVariation {
    public struct H2 {}
    public struct H3 {}
    public struct H4 {}
    public struct H5 {}
    public struct L {}
    public struct M {}
    public struct S {}
    public struct Xs {}
}

private extension AccordionAppearance {
    static var base: AccordionAppearance {
        var appearance = AccordionAppearance()
        appearance.dividerAppearance = Divider.default.appearance
        return appearance
    }
}
