import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionSolidActionStart {
    public static var h2: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.h2
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h2.appearance

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.h3
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h3.appearance

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.h4
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h4.appearance

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.h5
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.h5.appearance

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.l
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.m
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.s
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionSolidActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionSolidActionStartSize.xs
        appearance.accordionItemAppearance = AccordionItemSolidActionStart.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionAppearance>] = [
        AccordionSolidActionStart.h2.variation,
        AccordionSolidActionStart.h3.variation,
        AccordionSolidActionStart.h4.variation,
        AccordionSolidActionStart.h5.variation,
        AccordionSolidActionStart.l.variation,
        AccordionSolidActionStart.m.variation,
        AccordionSolidActionStart.s.variation,
        AccordionSolidActionStart.xs.variation,
    ]
}

public struct AccordionSolidActionStartVariation {
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
