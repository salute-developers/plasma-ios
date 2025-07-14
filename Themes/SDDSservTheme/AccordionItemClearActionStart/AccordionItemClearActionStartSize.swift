import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionItemClearActionStartSize {
    static let h2 = AccordionItemClearActionStartSizeH2()
    static let h3 = AccordionItemClearActionStartSizeH3()
    static let h4 = AccordionItemClearActionStartSizeH4()
    static let h5 = AccordionItemClearActionStartSizeH5()
    static let l = AccordionItemClearActionStartSizeL()
    static let m = AccordionItemClearActionStartSizeM()
    static let s = AccordionItemClearActionStartSizeS()
    static let xs = AccordionItemClearActionStartSizeXs()

    static let all: [AccordionItemSizeConfiguration] = [
        AccordionItemClearActionStartSize.h2,
        AccordionItemClearActionStartSize.h3,
        AccordionItemClearActionStartSize.h4,
        AccordionItemClearActionStartSize.h5,
        AccordionItemClearActionStartSize.l,
        AccordionItemClearActionStartSize.m,
        AccordionItemClearActionStartSize.s,
        AccordionItemClearActionStartSize.xs,
    ] 
}
struct AccordionItemClearActionStartSizeH2: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(32.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(16.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeH3: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(30.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(14.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeH4: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(22.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(11.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeH5: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(8.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(20.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(8.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeL: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(22.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(17.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(17.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeM: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(22.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(14.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeS: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(22.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(11.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}
struct AccordionItemClearActionStartSizeXs: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(8.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(20.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(8.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionStartSize"
    }
}

struct AccordionItemClearActionStartAnySize: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: AccordionItemSizeConfiguration) {
        self.contentPaddingBottom = size.contentPaddingBottom
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.iconPadding = size.iconPadding
        self.iconPlacement = size.iconPlacement
        self.iconRotation = size.iconRotation
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "AccordionItemClearActionStartAnySize"
    }
}
