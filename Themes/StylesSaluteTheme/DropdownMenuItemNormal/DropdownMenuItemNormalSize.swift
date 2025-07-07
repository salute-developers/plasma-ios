import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuItemNormalSize {
    static let l = DropdownMenuItemNormalSizeL()
    static let m = DropdownMenuItemNormalSizeM()
    static let s = DropdownMenuItemNormalSizeS()
    static let xs = DropdownMenuItemNormalSizeXs()

    static let all: [ListItemSizeConfiguration] = [
        DropdownMenuItemNormalSize.l,
        DropdownMenuItemNormalSize.m,
        DropdownMenuItemNormalSize.s,
        DropdownMenuItemNormalSize.xs,
    ] 
}
struct DropdownMenuItemNormalSizeL: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemNormalSize"
    }
}
struct DropdownMenuItemNormalSizeM: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemNormalSize"
    }
}
struct DropdownMenuItemNormalSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(11.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemNormalSize"
    }
}
struct DropdownMenuItemNormalSizeXs: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemNormalSize"
    }
}

struct DropdownMenuItemNormalAnySize: ListItemSizeConfiguration {
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
        return "DropdownMenuItemNormalAnySize"
    }
}
