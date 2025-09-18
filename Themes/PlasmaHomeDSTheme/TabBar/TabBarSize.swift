import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarSize {
    static let `default` = TabBarSizeDefault()

    static let all: [TabBarIslandSizeConfiguration] = [
        TabBarSize.`default`,
    ] 
}
struct TabBarSizeDefault: TabBarIslandSizeConfiguration {
    var bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius) as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(8.0)
    var contentPaddingStart = CGFloat(8.0)
    var contentPaddingTop = CGFloat(2.0)
    var itemSpacing = CGFloat(8.0)
    var paddingEnd = CGFloat(48.0)
    var paddingStart = CGFloat(48.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarSize"
    }
}

struct TabBarAnySize: TabBarIslandSizeConfiguration {
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
        return "TabBarAnySize"
    }
}
