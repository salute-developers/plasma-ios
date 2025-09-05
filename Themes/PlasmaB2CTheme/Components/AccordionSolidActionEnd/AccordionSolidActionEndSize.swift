import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionSolidActionEndSize {
    static let h2 = AccordionSolidActionEndSizeH2()
    static let h3 = AccordionSolidActionEndSizeH3()
    static let h4 = AccordionSolidActionEndSizeH4()
    static let h5 = AccordionSolidActionEndSizeH5()
    static let l = AccordionSolidActionEndSizeL()
    static let m = AccordionSolidActionEndSizeM()
    static let s = AccordionSolidActionEndSizeS()
    static let xs = AccordionSolidActionEndSizeXs()

    static let all: [AccordionSizeConfiguration] = [
        AccordionSolidActionEndSize.h2,
        AccordionSolidActionEndSize.h3,
        AccordionSolidActionEndSize.h4,
        AccordionSolidActionEndSize.h5,
        AccordionSolidActionEndSize.l,
        AccordionSolidActionEndSize.m,
        AccordionSolidActionEndSize.s,
        AccordionSolidActionEndSize.xs,
    ] 
}
struct AccordionSolidActionEndSizeH2: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeH3: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeH4: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeH5: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeL: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeM: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeS: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}
struct AccordionSolidActionEndSizeXs: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionEndSize"
    }
}

struct AccordionSolidActionEndAnySize: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(0)

    init(size: AccordionSizeConfiguration) {
        self.itemSpacing = size.itemSpacing
    }
    var debugDescription: String {
        return "AccordionSolidActionEndAnySize"
    }
}
