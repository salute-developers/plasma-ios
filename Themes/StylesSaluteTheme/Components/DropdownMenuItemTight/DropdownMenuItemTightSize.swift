import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DropdownMenuItemTightSize {
    static let l = DropdownMenuItemTightSizeL()
    static let m = DropdownMenuItemTightSizeM()
    static let s = DropdownMenuItemTightSizeS()
    static let xs = DropdownMenuItemTightSizeXs()

    static let all: [ListItemSizeConfiguration] = [
        DropdownMenuItemTightSize.l,
        DropdownMenuItemTightSize.m,
        DropdownMenuItemTightSize.s,
        DropdownMenuItemTightSize.xs,
    ] 
}
struct DropdownMenuItemTightSizeL: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemTightSize"
    }
}
struct DropdownMenuItemTightSizeM: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(8.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemTightSize"
    }
}
struct DropdownMenuItemTightSizeS: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(7.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(7.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemTightSize"
    }
}
struct DropdownMenuItemTightSizeXs: ListItemSizeConfiguration {
    var contentPaddingEnd = CGFloat(6.0)
    var height = CGFloat(24.0)
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "DropdownMenuItemTightSize"
    }
}

struct DropdownMenuItemTightAnySize: ListItemSizeConfiguration {
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
        return "DropdownMenuItemTightAnySize"
    }
}
