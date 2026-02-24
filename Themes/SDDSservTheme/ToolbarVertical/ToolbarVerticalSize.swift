import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToolbarVerticalSize {
    static let l = ToolbarVerticalSizeL()
    static let m = ToolbarVerticalSizeM()
    static let s = ToolbarVerticalSizeS()
    static let xs = ToolbarVerticalSizeXs()

    static let all: [ToolbarSizeConfiguration] = [
        ToolbarVerticalSize.l,
        ToolbarVerticalSize.m,
        ToolbarVerticalSize.s,
        ToolbarVerticalSize.xs,
    ] 
}
struct ToolbarVerticalSizeL: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(12.0)
    var orientation = TabsOrientation.vertical
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(12.0)
    public var debugDescription: String {
        return "ToolbarVerticalSize"
    }
}
struct ToolbarVerticalSizeM: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(10.0)
    var orientation = TabsOrientation.vertical
    var paddingBottom = CGFloat(6.0)
    var paddingEnd = CGFloat(6.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(10.0)
    public var debugDescription: String {
        return "ToolbarVerticalSize"
    }
}
struct ToolbarVerticalSizeS: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(8.0)
    var orientation = TabsOrientation.vertical
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(4.0)
    var paddingStart = CGFloat(4.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    var slotPadding = CGFloat(8.0)
    public var debugDescription: String {
        return "ToolbarVerticalSize"
    }
}
struct ToolbarVerticalSizeXs: ToolbarSizeConfiguration {
    var dividerMargin = CGFloat(6.0)
    var orientation = TabsOrientation.vertical
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(4.0)
    var paddingStart = CGFloat(4.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var slotPadding = CGFloat(8.0)
    public var debugDescription: String {
        return "ToolbarVerticalSize"
    }
}

struct ToolbarVerticalAnySize: ToolbarSizeConfiguration {
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
        return "ToolbarVerticalAnySize"
    }
}
