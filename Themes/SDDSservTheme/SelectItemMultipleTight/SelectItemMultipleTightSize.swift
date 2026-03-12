import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemMultipleTightSize {
    static let l = SelectItemMultipleTightSizeL()
    static let m = SelectItemMultipleTightSizeM()
    static let s = SelectItemMultipleTightSizeS()
    static let xl = SelectItemMultipleTightSizeXl()
    static let xs = SelectItemMultipleTightSizeXs()

    static let all: [SelectItemSizeConfiguration] = [
        SelectItemMultipleTightSize.l,
        SelectItemMultipleTightSize.m,
        SelectItemMultipleTightSize.s,
        SelectItemMultipleTightSize.xl,
        SelectItemMultipleTightSize.xs,
    ] 
}
struct SelectItemMultipleTightSizeL: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleTightSize"
    }
}
struct SelectItemMultipleTightSizeM: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleTightSize"
    }
}
struct SelectItemMultipleTightSizeS: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(7.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(7.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleTightSize"
    }
}
struct SelectItemMultipleTightSizeXl: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(8.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleTightSize"
    }
}
struct SelectItemMultipleTightSizeXs: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(4.0)
    var controlSize = CGFloat(16.0)
    var height = CGFloat(24.0)
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleTightSize"
    }
}

struct SelectItemMultipleTightAnySize: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(0)
    var controlSize = CGFloat(0)
    var height = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: SelectItemSizeConfiguration) {
        self.controlMargin = size.controlMargin
        self.controlSize = size.controlSize
        self.height = size.height
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "SelectItemMultipleTightAnySize"
    }
}
