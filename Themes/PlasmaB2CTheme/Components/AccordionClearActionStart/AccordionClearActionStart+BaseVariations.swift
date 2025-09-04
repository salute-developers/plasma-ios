import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

public struct AccordionClearActionStart {
    public static var h2: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.h2
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h2.appearance

        return .init(
            name: "h2",
            appearance: appearance
        )
    }
    public static var h3: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.h3
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h3.appearance

        return .init(
            name: "h3",
            appearance: appearance
        )
    }
    public static var h4: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.h4
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h4.appearance

        return .init(
            name: "h4",
            appearance: appearance
        )
    }
    public static var h5: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.h5
        appearance.accordionItemAppearance = AccordionItemClearActionStart.h5.appearance

        return .init(
            name: "h5",
            appearance: appearance
        )
    }
    public static var l: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.l
        appearance.accordionItemAppearance = AccordionItemClearActionStart.l.appearance

        return .init(
            name: "l",
            appearance: appearance
        )
    }
    public static var m: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.m
        appearance.accordionItemAppearance = AccordionItemClearActionStart.m.appearance

        return .init(
            name: "m",
            appearance: appearance
        )
    }
    public static var s: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.s
        appearance.accordionItemAppearance = AccordionItemClearActionStart.s.appearance

        return .init(
            name: "s",
            appearance: appearance
        )
    }
    public static var xs: ComponentAppearanceVariation<AccordionClearActionStart, AccordionAppearance> {
        var appearance = AccordionAppearance.base
        appearance.size = AccordionClearActionStartSize.xs
        appearance.accordionItemAppearance = AccordionItemClearActionStart.xs.appearance

        return .init(
            name: "xs",
            appearance: appearance
        )
    }
    
    public static let all: [Variation<AccordionAppearance>] = [
        AccordionClearActionStart.h2.variation,
        AccordionClearActionStart.h3.variation,
        AccordionClearActionStart.h4.variation,
        AccordionClearActionStart.h5.variation,
        AccordionClearActionStart.l.variation,
        AccordionClearActionStart.m.variation,
        AccordionClearActionStart.s.variation,
        AccordionClearActionStart.xs.variation,
    ]
}

public struct AccordionClearActionStartVariation {
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
