import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemTightSize {
    static let l = ListItemTightSizeL()
    static let m = ListItemTightSizeM()
    static let s = ListItemTightSizeS()
    static let xl = ListItemTightSizeXl()
    static let xs = ListItemTightSizeXs()

    static let all: [ListItemSizeConfiguration] = [
        ListItemTightSize.l,
        ListItemTightSize.m,
        ListItemTightSize.s,
        ListItemTightSize.xl,
        ListItemTightSize.xs,
    ] 
}
struct ListItemTightSizeL: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "ListItemTightSize"
    }
}
struct ListItemTightSizeM: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemTightSize"
    }
}
struct ListItemTightSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(7.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(7.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "ListItemTightSize"
    }
}
struct ListItemTightSizeXl: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemTightSize"
    }
}
struct ListItemTightSizeXs: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(24.0)
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemTightSize"
    }
}

struct ListItemTightAnySize: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(0)
    var height = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ListItemSizeConfiguration) {
        self.contentPaddingEnd = size.contentPaddingEnd
        self.height = size.height
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "ListItemTightAnySize"
    }
}
