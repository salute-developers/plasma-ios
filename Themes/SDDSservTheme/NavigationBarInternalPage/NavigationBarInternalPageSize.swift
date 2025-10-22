import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarInternalPageSize {
    static let hasBackground = NavigationBarInternalPageSizeHasbackground()
    static let noBackground = NavigationBarInternalPageSizeNobackground()

    static let all: [NavigationBarInternalPageSizeConfiguration] = [
        NavigationBarInternalPageSize.hasBackground,
        NavigationBarInternalPageSize.noBackground,
    ] 
}
struct NavigationBarInternalPageSizeHasbackground: NavigationBarInternalPageSizeConfiguration {
    var backIconMargin = CGFloat(4.0)
    var bottomShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var horizontalSpacing = CGFloat(16.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(20.0)
    var textBlockTopMargin = CGFloat(16.0)
    public var debugDescription: String {
        return "NavigationBarInternalPageSize"
    }
}
struct NavigationBarInternalPageSizeNobackground: NavigationBarInternalPageSizeConfiguration {
    var backIconMargin = CGFloat(4.0)
    var bottomShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var horizontalSpacing = CGFloat(16.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(20.0)
    var paddingStart = CGFloat(20.0)
    var paddingTop = CGFloat(20.0)
    var textBlockTopMargin = CGFloat(16.0)
    public var debugDescription: String {
        return "NavigationBarInternalPageSize"
    }
}

struct NavigationBarInternalPageAnySize: NavigationBarInternalPageSizeConfiguration {
    var backIconMargin = CGFloat(0)
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var horizontalSpacing = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var textBlockTopMargin = CGFloat(0)

    init(size: NavigationBarInternalPageSizeConfiguration) {
        self.backIconMargin = size.backIconMargin
        self.bottomShape = size.bottomShape
        self.horizontalSpacing = size.horizontalSpacing
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.textBlockTopMargin = size.textBlockTopMargin
    }
    var debugDescription: String {
        return "NavigationBarInternalPageAnySize"
    }
}
