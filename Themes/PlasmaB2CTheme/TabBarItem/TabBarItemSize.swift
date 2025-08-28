import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemSize {
    static let l = TabBarItemSizeL()
    static let m = TabBarItemSizeM()

    static let all: [TabBarItemSizeConfiguration] = [
        TabBarItemSize.l,
        TabBarItemSize.m,
    ] 
}
struct TabBarItemSizeL: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(36.0)
    var labelPadding = CGFloat(0)
    var labelPlacement = TabBarItemLabelPlacement.none
    var minHeight = CGFloat(64.0)
    var paddingBottom = CGFloat(14.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarItemSize"
    }
}
struct TabBarItemSizeM: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(24.0)
    var labelPadding = CGFloat(0)
    var labelPlacement = TabBarItemLabelPlacement.none
    var minHeight = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarItemSize"
    }
}

struct TabBarItemAnySize: TabBarItemSizeConfiguration {
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
        return "TabBarItemAnySize"
    }
}
