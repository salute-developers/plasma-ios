import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionItemSolidActionEndSize {
    static let h2 = AccordionItemSolidActionEndSizeH2()
    static let h3 = AccordionItemSolidActionEndSizeH3()
    static let h4 = AccordionItemSolidActionEndSizeH4()
    static let h5 = AccordionItemSolidActionEndSizeH5()
    static let l = AccordionItemSolidActionEndSizeL()
    static let m = AccordionItemSolidActionEndSizeM()
    static let s = AccordionItemSolidActionEndSizeS()
    static let xs = AccordionItemSolidActionEndSizeXs()

    static let all: [AccordionItemSizeConfiguration] = [
        AccordionItemSolidActionEndSize.h2,
        AccordionItemSolidActionEndSize.h3,
        AccordionItemSolidActionEndSize.h4,
        AccordionItemSolidActionEndSize.h5,
        AccordionItemSolidActionEndSize.l,
        AccordionItemSolidActionEndSize.m,
        AccordionItemSolidActionEndSize.s,
        AccordionItemSolidActionEndSize.xs,
    ] 
}
struct AccordionItemSolidActionEndSizeH2: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(20.0)
    var contentPaddingEnd = CGFloat(20.0)
    var contentPaddingStart = CGFloat(20.0)
    var iconPadding = CGFloat(16.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeH3: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(18.0)
    var contentPaddingEnd = CGFloat(18.0)
    var contentPaddingStart = CGFloat(18.0)
    var iconPadding = CGFloat(14.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeH4: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(14.0)
    var contentPaddingStart = CGFloat(14.0)
    var iconPadding = CGFloat(12.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeH5: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(12.0)
    var contentPaddingStart = CGFloat(12.0)
    var iconPadding = CGFloat(10.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeL: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(18.0)
    var contentPaddingEnd = CGFloat(20.0)
    var contentPaddingStart = CGFloat(20.0)
    var iconPadding = CGFloat(16.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(17.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(17.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeM: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(18.0)
    var contentPaddingStart = CGFloat(18.0)
    var iconPadding = CGFloat(14.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeS: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(14.0)
    var contentPaddingStart = CGFloat(14.0)
    var iconPadding = CGFloat(12.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}
struct AccordionItemSolidActionEndSizeXs: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(10.0)
    var contentPaddingEnd = CGFloat(12.0)
    var contentPaddingStart = CGFloat(12.0)
    var iconPadding = CGFloat(10.0)
    var iconPlacement = AccordionItemPlacement.end
    var iconRotation = CGFloat(90.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionEndSize"
    }
}

struct AccordionItemSolidActionEndAnySize: AccordionItemSizeConfiguration {
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
        return "AccordionItemSolidActionEndAnySize"
    }
}
