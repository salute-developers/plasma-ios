import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListItemSize {
    static let s = ListItemSizeS()

    static let all: [ListItemSizeConfiguration] = [
        ListItemSize.s,
    ] 
}
struct ListItemSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(12.0)
    var contentPaddingStart = CGFloat(12.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(10.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(10.0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListItemSize"
    }
}

struct ListItemAnySize: ListItemSizeConfiguration {
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
        return "ListItemAnySize"
    }
}
