import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabBarSize {
    static let `default` = TabBarSizeDefault()

    static let all: [TabBarSizeConfiguration] = [
        TabBarSize.`default`,
    ] 
}
struct TabBarSizeDefault: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(2.0)
    var contentPaddingEnd = CGFloat(8.0)
    var contentPaddingStart = CGFloat(8.0)
    var contentPaddingTop = CGFloat(2.0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(8.0)
    var topShape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxl.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "TabBarSize"
    }
}

struct TabBarAnySize: TabBarSizeConfiguration {
    var contentPaddingBottom = CGFloat(0)
    var contentPaddingEnd = CGFloat(0)
    var contentPaddingStart = CGFloat(0)
    var contentPaddingTop = CGFloat(0)
    var dividerThickness = CGFloat(0)
    var itemSpacing = CGFloat(0)
    var topShape = DefaultPathDrawer() as PathDrawer

    init(size: TabBarSizeConfiguration) {
        self.contentPaddingBottom = size.contentPaddingBottom
        self.contentPaddingEnd = size.contentPaddingEnd
        self.contentPaddingStart = size.contentPaddingStart
        self.contentPaddingTop = size.contentPaddingTop
        self.dividerThickness = size.dividerThickness
        self.itemSpacing = size.itemSpacing
        self.topShape = size.topShape
    }
    var debugDescription: String {
        return "TabBarAnySize"
    }
}
