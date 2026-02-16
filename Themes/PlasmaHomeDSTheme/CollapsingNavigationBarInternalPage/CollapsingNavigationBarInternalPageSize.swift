import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CollapsingNavigationBarInternalPageSize {
    static let `default` = CollapsingNavigationBarInternalPageSizeDefault()

    static let all: [CollapsingNavigationBarSizeConfiguration] = [
        CollapsingNavigationBarInternalPageSize.`default`,
    ]
}

struct CollapsingNavigationBarInternalPageSizeDefault: CollapsingNavigationBarSizeConfiguration {
    var backIconMargin = CGFloat(4.0)
    var descriptionPadding = CGFloat(12.0)
    var descriptionPaddingCollapsed = CGFloat(4.0)
    var horizontalSpacing = CGFloat(8.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(8.0)
    var textBlockTopMargin = CGFloat(16.0)
    var bottomShape = DefaultPathDrawer() as PathDrawer
    public var debugDescription: String {
        return "CollapsingNavigationBarInternalPageSize"
    }
}

struct CollapsingNavigationBarInternalPageAnySize: CollapsingNavigationBarSizeConfiguration {
    var backIconMargin = CGFloat(0)
    var descriptionPadding = CGFloat(0)
    var descriptionPaddingCollapsed = CGFloat(0)
    var horizontalSpacing = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var textBlockTopMargin = CGFloat(0)
    var bottomShape = DefaultPathDrawer() as PathDrawer

    init(size: CollapsingNavigationBarSizeConfiguration) {
        self.backIconMargin = size.backIconMargin
        self.descriptionPadding = size.descriptionPadding
        self.descriptionPaddingCollapsed = size.descriptionPaddingCollapsed
        self.horizontalSpacing = size.horizontalSpacing
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.textBlockTopMargin = size.textBlockTopMargin
        self.bottomShape = size.bottomShape
    }
    var debugDescription: String {
        return "CollapsingNavigationBarInternalPageAnySize"
    }
}
