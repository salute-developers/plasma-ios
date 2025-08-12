import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemClearSize {
    static let l = TabBarItemClearSizeL()
    static let m = TabBarItemClearSizeM()

    static let all: [TabBarItemSizeConfiguration] = [
        TabBarItemClearSize.l,
        TabBarItemClearSize.m,
    ] 
}
struct TabBarItemClearSizeL: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(36.0)
    var labelPadding = CGFloat(0)
    var labelPlacement = TabBarItemLabelPlacement.none
    var minHeight = CGFloat(64.0)
    var paddingBottom = CGFloat(14.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarItemClearSize"
    }
}
struct TabBarItemClearSizeM: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(24.0)
    var labelPadding = CGFloat(0)
    var labelPlacement = TabBarItemLabelPlacement.none
    var minHeight = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarItemClearSize"
    }
}

struct TabBarItemClearAnySize: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(0)
    var labelPadding = CGFloat(0)
    var labelPlacement = TabBarItemLabelPlacement.none
    var minHeight = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: TabBarItemSizeConfiguration) {
        self.iconSize = size.iconSize
        self.labelPadding = size.labelPadding
        self.labelPlacement = size.labelPlacement
        self.minHeight = size.minHeight
        self.paddingBottom = size.paddingBottom
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "TabBarItemClearAnySize"
    }
}
