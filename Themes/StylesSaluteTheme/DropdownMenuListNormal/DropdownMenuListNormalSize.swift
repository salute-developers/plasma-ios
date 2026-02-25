import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuListNormalSize {
    static let l = DropdownMenuListNormalSizeL()
    static let m = DropdownMenuListNormalSizeM()
    static let s = DropdownMenuListNormalSizeS()
    static let xs = DropdownMenuListNormalSizeXs()

    static let all: [ListSizeConfiguration] = [
        DropdownMenuListNormalSize.l,
        DropdownMenuListNormalSize.m,
        DropdownMenuListNormalSize.s,
        DropdownMenuListNormalSize.xs,
    ] 
}
struct DropdownMenuListNormalSizeL: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeM: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeS: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}
struct DropdownMenuListNormalSizeXs: ListSizeConfiguration {
    var gap = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuListNormalSize"
    }
}

struct DropdownMenuListNormalAnySize: ListSizeConfiguration {
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
        return "DropdownMenuListNormalAnySize"
    }
}
