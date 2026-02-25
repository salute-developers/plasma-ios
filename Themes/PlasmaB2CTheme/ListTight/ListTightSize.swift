import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ListTightSize {
    static let l = ListTightSizeL()
    static let m = ListTightSizeM()
    static let s = ListTightSizeS()
    static let xl = ListTightSizeXl()
    static let xs = ListTightSizeXs()

    static let all: [ListSizeConfiguration] = [
        ListTightSize.l,
        ListTightSize.m,
        ListTightSize.s,
        ListTightSize.xl,
        ListTightSize.xs,
    ] 
}
struct ListTightSizeL: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeM: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeS: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeXl: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListTightSize"
    }
}
struct ListTightSizeXs: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "ListTightSize"
    }
}

struct ListTightAnySize: ListSizeConfiguration {
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
        return "ListTightAnySize"
    }
}
