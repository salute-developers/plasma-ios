import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListNormalSize {
    static let l = ListNormalSizeL()
    static let m = ListNormalSizeM()
    static let s = ListNormalSizeS()
    static let xl = ListNormalSizeXl()
    static let xs = ListNormalSizeXs()

    static let all: [ListSizeConfiguration] = [
        ListNormalSize.l,
        ListNormalSize.m,
        ListNormalSize.s,
        ListNormalSize.xl,
        ListNormalSize.xs,
    ] 
}
struct ListNormalSizeL: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeM: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeS: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeXl: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNormalSize"
    }
}
struct ListNormalSizeXs: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListNormalSize"
    }
}

struct ListNormalAnySize: ListSizeConfiguration {
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
        return "ListNormalAnySize"
    }
}
