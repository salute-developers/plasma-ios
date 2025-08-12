import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandHasLabelClearSize {
    static let l = TabBarIslandHasLabelClearSizeL()
    static let m = TabBarIslandHasLabelClearSizeM()

    static let all: [TabBarIslandSizeConfiguration] = [
        TabBarIslandHasLabelClearSize.l,
        TabBarIslandHasLabelClearSize.m,
    ] 
}
struct TabBarIslandHasLabelClearSizeL: TabBarIslandSizeConfiguration {
    var bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    public var debugDescription: String {
        return "TabBarIslandHasLabelClearSize"
    }
}
struct TabBarIslandHasLabelClearSizeM: TabBarIslandSizeConfiguration {
    var bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    public var debugDescription: String {
        return "TabBarIslandHasLabelClearSize"
    }
}

struct TabBarIslandHasLabelClearAnySize: TabBarIslandSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var contentPaddingBottom = CGFloat(0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var contentPaddingTop = CGFloat(0)
    var itemSpacing = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer

    init(size: TabBarIslandSizeConfiguration) {
        self.bottomShape = size.bottomShape
        self.contentPaddingBottom = size.contentPaddingBottom
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.contentPaddingTop = size.contentPaddingTop
        self.itemSpacing = size.itemSpacing
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.topShape = size.topShape
    }
    var debugDescription: String {
        return "TabBarIslandHasLabelClearAnySize"
    }
}
