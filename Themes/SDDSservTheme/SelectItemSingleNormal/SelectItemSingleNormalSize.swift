import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemSingleNormalSize {
    static let l = SelectItemSingleNormalSizeL()
    static let m = SelectItemSingleNormalSizeM()
    static let s = SelectItemSingleNormalSizeS()
    static let xl = SelectItemSingleNormalSizeXl()
    static let xs = SelectItemSingleNormalSizeXs()

    static let all: [SelectItemSizeConfiguration] = [
        SelectItemSingleNormalSize.l,
        SelectItemSingleNormalSize.m,
        SelectItemSingleNormalSize.s,
        SelectItemSingleNormalSize.xl,
        SelectItemSingleNormalSize.xs,
    ] 
}
struct SelectItemSingleNormalSizeL: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemSingleNormalSize"
    }
}
struct SelectItemSingleNormalSizeM: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemSingleNormalSize"
    }
}
struct SelectItemSingleNormalSizeS: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemSingleNormalSize"
    }
}
struct SelectItemSingleNormalSizeXl: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(8.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(64.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(20.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemSingleNormalSize"
    }
}
struct SelectItemSingleNormalSizeXs: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(4.0)
    var controlSize = CGFloat(16.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemSingleNormalSize"
    }
}

struct SelectItemSingleNormalAnySize: SelectItemSizeConfiguration {
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
        return "SelectItemSingleNormalAnySize"
    }
}
