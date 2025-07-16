import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionItemClearActionEndSize {
    static let h2 = AccordionItemClearActionEndSizeH2()
    static let h3 = AccordionItemClearActionEndSizeH3()
    static let h4 = AccordionItemClearActionEndSizeH4()
    static let h5 = AccordionItemClearActionEndSizeH5()
    static let l = AccordionItemClearActionEndSizeL()
    static let m = AccordionItemClearActionEndSizeM()
    static let s = AccordionItemClearActionEndSizeS()
    static let xs = AccordionItemClearActionEndSizeXs()

    static let all: [AccordionItemSizeConfiguration] = [
        AccordionItemClearActionEndSize.h2,
        AccordionItemClearActionEndSize.h3,
        AccordionItemClearActionEndSize.h4,
        AccordionItemClearActionEndSize.h5,
        AccordionItemClearActionEndSize.l,
        AccordionItemClearActionEndSize.m,
        AccordionItemClearActionEndSize.s,
        AccordionItemClearActionEndSize.xs,
    ] 
}
struct AccordionItemClearActionEndSizeH2: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(16.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(16.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeH3: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(14.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(14.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeH4: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(12.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(11.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeH5: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(8.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(10.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(8.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeL: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(16.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(17.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(17.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeM: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(14.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(14.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeS: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(12.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(11.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}
struct AccordionItemClearActionEndSizeXs: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(8.0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var iconPadding = CGFloat(10.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(8.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "AccordionItemClearActionEndSize"
    }
}

struct AccordionItemClearActionEndAnySize: AccordionItemSizeConfiguration {
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
        return "AccordionItemClearActionEndAnySize"
    }
}
