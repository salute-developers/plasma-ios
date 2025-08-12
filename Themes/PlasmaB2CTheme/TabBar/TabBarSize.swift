import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarSize {
    static let l = TabBarSizeL()
    static let m = TabBarSizeM()

    static let all: [TabBarSizeConfiguration] = [
        TabBarSize.l,
        TabBarSize.m,
    ] 
}
struct TabBarSizeL: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var topShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "TabBarSize"
    }
}
struct TabBarSizeM: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var topShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "TabBarSize"
    }
}

struct TabBarAnySize: TabBarSizeConfiguration {
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
        return "TabBarAnySize"
    }
}
