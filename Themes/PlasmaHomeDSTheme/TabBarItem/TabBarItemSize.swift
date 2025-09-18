import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarItemSize {
    static let `default` = TabBarItemSizeDefault()

    static let all: [TabBarItemSizeConfiguration] = [
        TabBarItemSize.`default`,
    ] 
}
struct TabBarItemSizeDefault: TabBarItemSizeConfiguration {
    var iconSize = CGFloat(24.0)
    var labelPadding = CGFloat(2.0)
    var labelPlacement = TabBarItemLabelPlacement.bottom
    var minHeight = CGFloat(60.0)
    var paddingBottom = CGFloat(11.0)
    var paddingTop = CGFloat(11.0)
    var shape = DefaultPathDrawer() as PathDrawer
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
