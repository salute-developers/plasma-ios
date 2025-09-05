import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionSolidActionStartSize {
    static let h2 = AccordionSolidActionStartSizeH2()
    static let h3 = AccordionSolidActionStartSizeH3()
    static let h4 = AccordionSolidActionStartSizeH4()
    static let h5 = AccordionSolidActionStartSizeH5()
    static let l = AccordionSolidActionStartSizeL()
    static let m = AccordionSolidActionStartSizeM()
    static let s = AccordionSolidActionStartSizeS()
    static let xs = AccordionSolidActionStartSizeXs()

    static let all: [AccordionSizeConfiguration] = [
        AccordionSolidActionStartSize.h2,
        AccordionSolidActionStartSize.h3,
        AccordionSolidActionStartSize.h4,
        AccordionSolidActionStartSize.h5,
        AccordionSolidActionStartSize.l,
        AccordionSolidActionStartSize.m,
        AccordionSolidActionStartSize.s,
        AccordionSolidActionStartSize.xs,
    ] 
}
struct AccordionSolidActionStartSizeH2: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeH3: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeH4: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeH5: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeL: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeM: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeS: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}
struct AccordionSolidActionStartSizeXs: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(2.0)
    public var debugDescription: String {
        return "AccordionSolidActionStartSize"
    }
}

struct AccordionSolidActionStartAnySize: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(0)

    init(size: AccordionSizeConfiguration) {
        self.itemSpacing = size.itemSpacing
    }
    var debugDescription: String {
        return "AccordionSolidActionStartAnySize"
    }
}
