import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AccordionItemSolidActionStartSize {
    static let h2 = AccordionItemSolidActionStartSizeH2()
    static let h3 = AccordionItemSolidActionStartSizeH3()
    static let h4 = AccordionItemSolidActionStartSizeH4()
    static let h5 = AccordionItemSolidActionStartSizeH5()
    static let l = AccordionItemSolidActionStartSizeL()
    static let m = AccordionItemSolidActionStartSizeM()
    static let s = AccordionItemSolidActionStartSizeS()
    static let xs = AccordionItemSolidActionStartSizeXs()

    static let all: [AccordionItemSizeConfiguration] = [
        AccordionItemSolidActionStartSize.h2,
        AccordionItemSolidActionStartSize.h3,
        AccordionItemSolidActionStartSize.h4,
        AccordionItemSolidActionStartSize.h5,
        AccordionItemSolidActionStartSize.l,
        AccordionItemSolidActionStartSize.m,
        AccordionItemSolidActionStartSize.s,
        AccordionItemSolidActionStartSize.xs,
    ] 
}
struct AccordionItemSolidActionStartSizeH2: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(20.0)
    var contentPaddingEnd = CGFloat(20.0)
    var contentPaddingStart = CGFloat(52.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeH3: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(18.0)
    var contentPaddingEnd = CGFloat(18.0)
    var contentPaddingStart = CGFloat(48.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeH4: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(14.0)
    var contentPaddingEnd = CGFloat(14.0)
    var contentPaddingStart = CGFloat(36.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeH5: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(12.0)
    var contentPaddingStart = CGFloat(12.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeL: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(18.0)
    var contentPaddingEnd = CGFloat(20.0)
    var contentPaddingStart = CGFloat(42.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(17.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(17.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeM: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(16.0)
    var contentPaddingEnd = CGFloat(18.0)
    var contentPaddingStart = CGFloat(40.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeS: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(12.0)
    var contentPaddingEnd = CGFloat(14.0)
    var contentPaddingStart = CGFloat(36.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}
struct AccordionItemSolidActionStartSizeXs: AccordionItemSizeConfiguration {
    var contentPaddingBottom = CGFloat(10.0)
    var contentPaddingEnd = CGFloat(12.0)
    var contentPaddingStart = CGFloat(32.0)
    var iconPadding = CGFloat(4.0)
    var iconPlacement = AccordionItemPlacement.start
    var iconRotation = CGFloat(180.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "AccordionItemSolidActionStartSize"
    }
}

struct AccordionItemSolidActionStartAnySize: AccordionItemSizeConfiguration {
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
        return "AccordionItemSolidActionStartAnySize"
    }
}
