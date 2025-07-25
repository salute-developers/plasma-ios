import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionSolidActionEnd {
    public static var h2: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.h2
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h2.appearance

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.h3
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h3.appearance

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.h4
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h4.appearance

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.h5
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.h5.appearance

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.l
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.m
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.s
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionSolidActionEnd, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionEndSize.xs
        appearance.accordionItemAppearance = AccordionItemSolidActionEnd.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionAppearance>] = [
        AccordionSolidActionEnd.h2.variation,
        AccordionSolidActionEnd.h3.variation,
        AccordionSolidActionEnd.h4.variation,
        AccordionSolidActionEnd.h5.variation,
        AccordionSolidActionEnd.l.variation,
        AccordionSolidActionEnd.m.variation,
        AccordionSolidActionEnd.s.variation,
        AccordionSolidActionEnd.xs.variation,
    ]
}

public struct AccordionSolidActionEndVariation {
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
        return appearance
    }
}
