import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ToastSize {
    static let `default` = ToastSizeDefault()

    static let all: [ToastSizeConfiguration] = [
        ToastSize.`default`,
    ] 
}
struct ToastSizeDefault: ToastSizeConfiguration {
    var contentEndPadding = CGFloat(6.0)
    var contentEndSize = CGFloat(16.0)
    var contentStartPadding = CGFloat(6.0)
    var contentStartSize = CGFloat(16.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CircleDrawer() as PathDrawer
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
