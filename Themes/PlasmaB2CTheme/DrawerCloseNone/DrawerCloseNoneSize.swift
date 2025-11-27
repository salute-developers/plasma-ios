import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct DrawerCloseNoneSize {
    static let m = DrawerCloseNoneSizeM()

    static let all: [DrawerSizeConfiguration] = [
        DrawerCloseNoneSize.m,
    ] 
}
struct DrawerCloseNoneSizeM: DrawerSizeConfiguration {
    var closeIconHeaderPadding = CGFloat(0.0)
    var closeIconOffsetX = CGFloat(0.0)
    var closeIconOffsetY = CGFloat(0.0)
    var closeIconPlacement = DrawerCloseIconPlacement.none
    var closeIconSize = CGFloat(24)
    var paddingBottom = CGFloat(24.0)
    var paddingEnd = CGFloat(24.0)
    var paddingStart = CGFloat(24.0)
    var paddingTop = CGFloat(24.0)
    public var debugDescription: String {
        return "DrawerCloseNoneSize"
    }
}

struct DrawerCloseNoneAnySize: DrawerSizeConfiguration {
    var closeIconHeaderPadding = CGFloat(0)
    var closeIconOffsetX = CGFloat(0)
    var closeIconOffsetY = CGFloat(0)
    var closeIconPlacement = DrawerCloseIconPlacement.none
    var closeIconSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)

    init(size: DrawerSizeConfiguration) {
        self.closeIconHeaderPadding = size.closeIconHeaderPadding
        self.closeIconOffsetX = size.closeIconOffsetX
        self.closeIconOffsetY = size.closeIconOffsetY
        self.closeIconPlacement = size.closeIconPlacement
        self.closeIconSize = size.closeIconSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
    }
    var debugDescription: String {
        return "DrawerCloseNoneAnySize"
    }
}
