import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToolbarHorizontalSize {
    static let l = ToolbarHorizontalSizeL()
    static let m = ToolbarHorizontalSizeM()
    static let s = ToolbarHorizontalSizeS()
    static let xs = ToolbarHorizontalSizeXs()

    static let all: [ToolbarSizeConfiguration] = [
        ToolbarHorizontalSize.l,
        ToolbarHorizontalSize.m,
        ToolbarHorizontalSize.s,
        ToolbarHorizontalSize.xs,
    ] 
}
struct ToolbarHorizontalSizeL: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(12.0)
    var orientation = TabsOrientation.horizontal
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(12.0)
    public var debugDescription: String {
        return "ToolbarHorizontalSize"
    }
}
struct ToolbarHorizontalSizeM: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(10.0)
    var orientation = TabsOrientation.horizontal
    var paddingBottom = CGFloat(6.0)
    var paddingEnd = CGFloat(6.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(10.0)
    public var debugDescription: String {
        return "ToolbarHorizontalSize"
    }
}
struct ToolbarHorizontalSizeS: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(8.0)
    var orientation = TabsOrientation.horizontal
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(4.0)
    var paddingStart = CGFloat(4.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var slotPadding = CGFloat(8.0)
    public var debugDescription: String {
        return "ToolbarHorizontalSize"
    }
}
struct ToolbarHorizontalSizeXs: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(6.0)
    var orientation = TabsOrientation.horizontal
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(4.0)
    var paddingStart = CGFloat(4.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(8.0)
    public var debugDescription: String {
        return "ToolbarHorizontalSize"
    }
}

struct ToolbarHorizontalAnySize: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer
    var slotPadding = CGFloat(0)

    init(size: ToolbarSizeConfiguration) {
        self.dividerMargin = size.dividerMargin
        self.orientation = size.orientation
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
        self.slotPadding = size.slotPadding
    }
    var debugDescription: String {
        return "ToolbarHorizontalAnySize"
    }
}
