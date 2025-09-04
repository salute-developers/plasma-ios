import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionClearActionStartSize {
    static let h2 = AccordionClearActionStartSizeH2()
    static let h3 = AccordionClearActionStartSizeH3()
    static let h4 = AccordionClearActionStartSizeH4()
    static let h5 = AccordionClearActionStartSizeH5()
    static let l = AccordionClearActionStartSizeL()
    static let m = AccordionClearActionStartSizeM()
    static let s = AccordionClearActionStartSizeS()
    static let xs = AccordionClearActionStartSizeXs()

    static let all: [AccordionSizeConfiguration] = [
        AccordionClearActionStartSize.h2,
        AccordionClearActionStartSize.h3,
        AccordionClearActionStartSize.h4,
        AccordionClearActionStartSize.h5,
        AccordionClearActionStartSize.l,
        AccordionClearActionStartSize.m,
        AccordionClearActionStartSize.s,
        AccordionClearActionStartSize.xs,
    ] 
}
struct AccordionClearActionStartSizeH2: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(16.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeH3: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(14.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeH4: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(12.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeH5: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeL: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(10.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeM: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(8.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeS: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(6.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}
struct AccordionClearActionStartSizeXs: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(4.0)
    public var debugDescription: String {
        return "AccordionClearActionStartSize"
    }
}

struct AccordionClearActionStartAnySize: AccordionSizeConfiguration {
    var itemSpacing = CGFloat(0)

    init(size: AccordionSizeConfiguration) {
        self.itemSpacing = size.itemSpacing
    }
    var debugDescription: String {
        return "AccordionClearActionStartAnySize"
    }
}
