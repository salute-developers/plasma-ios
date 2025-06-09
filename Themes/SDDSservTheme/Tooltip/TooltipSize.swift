import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TooltipSize {
    static let m = TooltipSizeM()
    static let s = TooltipSizeS()

    static let all: [TooltipSizeConfiguration] = [
        TooltipSize.m,
        TooltipSize.s,
    ] 
}
struct TooltipSizeM: TooltipSizeConfiguration {
    var contentStartPadding = CGFloat(6.0)
    var contentStartSize = CGFloat(16.0)
    var offset = CGFloat(8.0)
    var paddingBottom = CGFloat(11.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(11.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius - 2.0) as PathDrawer
    var tailHeight = CGFloat(8.0)
    var tailPadding = CGFloat(10.0)
    var tailWidth = CGFloat(20.0)
    public var debugDescription: String {
        return "TooltipSize"
    }
}
struct TooltipSizeS: TooltipSizeConfiguration {
    var contentStartPadding = CGFloat(4.0)
    var contentStartSize = CGFloat(16.0)
    var offset = CGFloat(6.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(8.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    var tailHeight = CGFloat(6.0)
    var tailPadding = CGFloat(9.0)
    var tailWidth = CGFloat(14.0)
    public var debugDescription: String {
        return "TooltipSize"
    }
}

struct TooltipAnySize: TooltipSizeConfiguration {
    var contentStartPadding = CGFloat(0)
    var contentStartSize = CGFloat(0)
    var offset = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var tailHeight = CGFloat(0)
    var tailPadding = CGFloat(0)
    var tailWidth = CGFloat(0)

    init(size: TooltipSizeConfiguration) {
        self.contentStartPadding = size.contentStartPadding
        self.contentStartSize = size.contentStartSize
        self.offset = size.offset
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.pathDrawer = size.pathDrawer
        self.tailHeight = size.tailHeight
        self.tailPadding = size.tailPadding
        self.tailWidth = size.tailWidth
    }
    var debugDescription: String {
        return "TooltipAnySize"
    }
}
