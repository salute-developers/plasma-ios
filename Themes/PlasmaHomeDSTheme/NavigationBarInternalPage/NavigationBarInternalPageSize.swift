import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarInternalPageSize {
    static let `default` = NavigationBarInternalPageSizeDefault()

    static let all: [NavigationBarInternalPageSizeConfiguration] = [
        NavigationBarInternalPageSize.`default`,
    ] 
}
struct NavigationBarInternalPageSizeDefault: NavigationBarInternalPageSizeConfiguration {
    var backIconMargin = CGFloat(4.0)
    var bottomShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var horizontalSpacing = CGFloat(8.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(8.0)
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
