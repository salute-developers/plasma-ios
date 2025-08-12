import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarClearSize {
    static let l = TabBarClearSizeL()
    static let m = TabBarClearSizeM()

    static let all: [TabBarSizeConfiguration] = [
        TabBarClearSize.l,
        TabBarClearSize.m,
    ] 
}
struct TabBarClearSizeL: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var topShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "TabBarClearSize"
    }
}
struct TabBarClearSizeM: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var topShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "TabBarClearSize"
    }
}

struct TabBarClearAnySize: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var contentPaddingTop = CGFloat(0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer

    init(size: TabBarSizeConfiguration) {
        self.contentPaddingBottom = size.contentPaddingBottom
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.contentPaddingTop = size.contentPaddingTop
        self.dividerThickness = size.dividerThickness
        self.itemSpacing = size.itemSpacing
        self.topShape = size.topShape
    }
    var debugDescription: String {
        return "TabBarClearAnySize"
    }
}
