import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarIslandSize {
    static let l = TabBarIslandSizeL()
    static let m = TabBarIslandSizeM()

    static let all: [TabBarSizeConfiguration] = [
        TabBarIslandSize.l,
        TabBarIslandSize.m,
    ] 
}
struct TabBarIslandSizeL: TabBarSizeConfiguration {
    var bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    public var debugDescription: String {
        return "TabBarIslandSize"
    }
}
struct TabBarIslandSizeM: TabBarSizeConfiguration {
    var bottomShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(2.0)
    var contentPaddingStart = CGFloat(2.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(2.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius+2.0) as PathDrawer
    public var debugDescription: String {
        return "TabBarIslandSize"
    }
}

struct TabBarIslandAnySize: TabBarSizeConfiguration {
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
        return "TabBarIslandAnySize"
    }
}
