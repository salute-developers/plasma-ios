import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BottomSheetSize {
    static let Default = BottomSheetSizeDefault()

    static let all: [BottomSheetSizeConfiguration] = [
        BottomSheetSize.Default,
    ] 
}
struct BottomSheetSizeDefault: BottomSheetSizeConfiguration {
    var handleHeight = CGFloat(4.0)
    var handleOffset = CGFloat(6.0)
    var handlePathDrawer = CircleDrawer() as PathDrawer
    var handleWidth = CGFloat(48.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXl.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "BottomSheetSize"
    }
}

struct BottomSheetAnySize: BottomSheetSizeConfiguration {
    var handleHeight = CGFloat(0)
    var handleOffset = CGFloat(0)
    var handlePathDrawer = DefaultPathDrawer() as PathDrawer
    var handleWidth = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer

    init(size: BottomSheetSizeConfiguration) {
        self.handleHeight = size.handleHeight
        self.handleOffset = size.handleOffset
        self.handlePathDrawer = size.handlePathDrawer
        self.handleWidth = size.handleWidth
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.pathDrawer = size.pathDrawer
    }
    var debugDescription: String {
        return "BottomSheetAnySize"
    }
}
