import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListSize {
    static let s = ListSizeS()

    static let all: [ListSizeConfiguration] = [
        ListSize.s,
    ] 
}
struct ListSizeS: ListSizeConfiguration {
    var gap = CGFloat(8.0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListSize"
    }
}

struct ListAnySize: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ListSizeConfiguration) {
        self.gap = size.gap
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "ListAnySize"
    }
}
