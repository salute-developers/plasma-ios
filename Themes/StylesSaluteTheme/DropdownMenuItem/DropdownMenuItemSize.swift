import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuItemSize {
    static let l = DropdownMenuItemSizeL()
    static let m = DropdownMenuItemSizeM()
    static let s = DropdownMenuItemSizeS()
    static let xs = DropdownMenuItemSizeXs()

    static let all: [ListItemSizeConfiguration] = [
        DropdownMenuItemSize.l,
        DropdownMenuItemSize.m,
        DropdownMenuItemSize.s,
        DropdownMenuItemSize.xs,
    ] 
}
struct DropdownMenuItemSizeL: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemSize"
    }
}
struct DropdownMenuItemSizeM: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemSize"
    }
}
struct DropdownMenuItemSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemSize"
    }
}
struct DropdownMenuItemSizeXs: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemSize"
    }
}

struct DropdownMenuItemAnySize: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(0)
    var height = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ListItemSizeConfiguration) {
        self.contentPaddingEnd = size.contentPaddingEnd
        self.height = size.height
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "DropdownMenuItemAnySize"
    }
}
