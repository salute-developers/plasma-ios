import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionClearActionEndSize {
    static let h2 = AccordionClearActionEndSizeH2()
    static let h3 = AccordionClearActionEndSizeH3()
    static let h4 = AccordionClearActionEndSizeH4()
    static let h5 = AccordionClearActionEndSizeH5()
    static let l = AccordionClearActionEndSizeL()
    static let m = AccordionClearActionEndSizeM()
    static let s = AccordionClearActionEndSizeS()
    static let xs = AccordionClearActionEndSizeXs()

    static let all: [AccordionSizeConfiguration] = [
        AccordionClearActionEndSize.h2,
        AccordionClearActionEndSize.h3,
        AccordionClearActionEndSize.h4,
        AccordionClearActionEndSize.h5,
        AccordionClearActionEndSize.l,
        AccordionClearActionEndSize.m,
        AccordionClearActionEndSize.s,
        AccordionClearActionEndSize.xs,
    ] 
}
struct AccordionClearActionEndSizeH2: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(16.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeH3: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(14.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeH4: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(12.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeH5: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeL: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeM: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(8.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeS: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(6.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}
struct AccordionClearActionEndSizeXs: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(4.0)
    public var debugDescription: String {
        return "AccordionClearActionEndSize"
    }
}

struct AccordionClearActionEndAnySize: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(0)

    init(size: AccordionSizeConfiguration) {
        self.itemSpacing = size.itemSpacing
    }
    var debugDescription: String {
        return "AccordionClearActionEndAnySize"
    }
}
