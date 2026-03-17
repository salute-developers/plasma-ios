import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SelectItemMultipleNormalSize {
    static let l = SelectItemMultipleNormalSizeL()
    static let m = SelectItemMultipleNormalSizeM()
    static let s = SelectItemMultipleNormalSizeS()
    static let xl = SelectItemMultipleNormalSizeXl()
    static let xs = SelectItemMultipleNormalSizeXs()

    static let all: [SelectItemSizeConfiguration] = [
        SelectItemMultipleNormalSize.l,
        SelectItemMultipleNormalSize.m,
        SelectItemMultipleNormalSize.s,
        SelectItemMultipleNormalSize.xl,
        SelectItemMultipleNormalSize.xs,
    ] 
}
struct SelectItemMultipleNormalSizeL: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(56.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleNormalSize"
    }
}
struct SelectItemMultipleNormalSizeM: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(48.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleNormalSize"
    }
}
struct SelectItemMultipleNormalSizeS: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(6.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(40.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleNormalSize"
    }
}
struct SelectItemMultipleNormalSizeXl: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(8.0)
    var controlSize = CGFloat(24.0)
    var height = CGFloat(64.0)
    var paddingBottom = CGFloat(20.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(20.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleNormalSize"
    }
}
struct SelectItemMultipleNormalSizeXs: SelectItemSizeConfiguration {
    var controlMargin = CGFloat(4.0)
    var controlSize = CGFloat(16.0)
    var height = CGFloat(32.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "SelectItemMultipleNormalSize"
    }
}

struct SelectItemMultipleNormalAnySize: SelectItemSizeConfiguration {
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
        return "SelectItemMultipleNormalAnySize"
    }
}
