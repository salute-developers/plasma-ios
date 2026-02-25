import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NavigationBarMainPageSize {
    static let `default` = NavigationBarMainPageSizeDefault()

    static let all: [NavigationBarMainPageSizeConfiguration] = [
        NavigationBarMainPageSize.`default`,
    ] 
}
struct NavigationBarMainPageSizeDefault: NavigationBarMainPageSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var horizontalSpacing = CGFloat(8.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(8.0)
    var textBlockTopMargin = CGFloat(16.0)
    public var debugDescription: String {
        return "NavigationBarMainPageSize"
    }
}

struct NavigationBarMainPageAnySize: NavigationBarMainPageSizeConfiguration {
    var bottomShape = DefaultPathDrawer() as PathDrawer
    var horizontalSpacing = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var textBlockTopMargin = CGFloat(0)

    init(size: NavigationBarMainPageSizeConfiguration) {
        self.bottomShape = size.bottomShape
        self.horizontalSpacing = size.horizontalSpacing
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.textBlockTopMargin = size.textBlockTopMargin
    }
    var debugDescription: String {
        return "NavigationBarMainPageAnySize"
    }
}
