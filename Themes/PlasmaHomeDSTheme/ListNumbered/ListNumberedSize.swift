import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNumberedSize {
    static let s = ListNumberedSizeS()

    static let all: [ListSizeConfiguration] = [
        ListNumberedSize.s,
    ] 
}
struct ListNumberedSizeS: ListSizeConfiguration {
    var gap = CGFloat(12.0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNumberedSize"
    }
}

struct ListNumberedAnySize: ListSizeConfiguration {
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
        return "ListNumberedAnySize"
    }
}
