import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemNormalSize {
    static let l = ListItemNormalSizeL()
    static let m = ListItemNormalSizeM()
    static let s = ListItemNormalSizeS()
    static let xl = ListItemNormalSizeXl()
    static let xs = ListItemNormalSizeXs()

    static let all: [ListItemSizeConfiguration] = [
        ListItemNormalSize.l,
        ListItemNormalSize.m,
        ListItemNormalSize.s,
        ListItemNormalSize.xl,
        ListItemNormalSize.xs,
    ] 
}
struct ListItemNormalSizeL: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "ListItemNormalSize"
    }
}
struct ListItemNormalSizeM: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemNormalSize"
    }
}
struct ListItemNormalSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "ListItemNormalSize"
    }
}
struct ListItemNormalSizeXl: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(64.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var paddingTop = CGFloat(20.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemNormalSize"
    }
}
struct ListItemNormalSizeXs: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ListItemNormalSize"
    }
}

struct ListItemNormalAnySize: ListItemSizeConfiguration {
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
        return "ListItemNormalAnySize"
    }
}
