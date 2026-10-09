import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarSolidSize {
    static let l = TabBarSolidSizeL()
    static let m = TabBarSolidSizeM()

    static let all: [TabBarSizeConfiguration] = [
        TabBarSolidSize.l,
        TabBarSolidSize.m,
    ] 
}
struct TabBarSolidSizeL: TabBarSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer
    public var debugDescription: String {
        return "TabBarSolidSize"
    }
}
struct TabBarSolidSizeM: TabBarSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer
    public var debugDescription: String {
        return "TabBarSolidSize"
    }
}

struct TabBarSolidAnySize: TabBarSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var contentPaddingBottom = CGFloat(0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var contentPaddingTop = CGFloat(0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer

    init(size: TabBarSizeConfiguration) {
        self.bottomShape = size.bottomShape
        self.contentPaddingBottom = size.contentPaddingBottom
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.contentPaddingTop = size.contentPaddingTop
        self.dividerThickness = size.dividerThickness
        self.itemSpacing = size.itemSpacing
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.topShape = size.topShape
    }
    var debugDescription: String {
        return "TabBarSolidAnySize"
    }
}
