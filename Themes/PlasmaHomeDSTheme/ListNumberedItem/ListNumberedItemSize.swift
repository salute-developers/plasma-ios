import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedItemSize {
    static let s = ListNumberedItemSizeS()

    static let all: [ListItemSizeConfiguration] = [
        ListNumberedItemSize.s,
    ] 
}
struct ListNumberedItemSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(6.0)
    var height = CGFloat(0)
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNumberedItemSize"
    }
}

struct ListNumberedItemAnySize: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var height = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ListItemSizeConfiguration) {
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.height = size.height
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "ListNumberedItemAnySize"
    }
}
