import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToastSize {
    static let pilled = ToastSizePilled()
    static let rounded = ToastSizeRounded()

    static let all: [ToastSizeConfiguration] = [
        ToastSize.pilled,
        ToastSize.rounded,
    ] 
}
struct ToastSizePilled: ToastSizeConfiguration {
    var contentEndPadding = CGFloat(8.0)
    var contentEndSize = CGFloat(16.0)
    var contentStartPadding = CGFloat(6.0)
    var contentStartSize = CGFloat(16.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(8.0)
    var shape = CircleDrawer() as PathDrawer
    public var debugDescription: String {
        return "ToastSize"
    }
}
struct ToastSizeRounded: ToastSizeConfiguration {
    var contentEndPadding = CGFloat(8.0)
    var contentEndSize = CGFloat(16.0)
    var contentStartPadding = CGFloat(6.0)
    var contentStartSize = CGFloat(16.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "ToastSize"
    }
}

struct ToastAnySize: ToastSizeConfiguration {
    var contentEndPadding = CGFloat(0)
    var contentEndSize = CGFloat(0)
    var contentStartPadding = CGFloat(0)
    var contentStartSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: ToastSizeConfiguration) {
        self.contentEndPadding = size.contentEndPadding
        self.contentEndSize = size.contentEndSize
        self.contentStartPadding = size.contentStartPadding
        self.contentStartSize = size.contentStartSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "ToastAnySize"
    }
}
