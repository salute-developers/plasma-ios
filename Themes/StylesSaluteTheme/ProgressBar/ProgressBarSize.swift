import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarSize {
    static let Default = ProgressBarSizeDefault()

    static let all: [ProgressBarSizeConfiguration] = [
        ProgressBarSize.Default,
    ] 
}
struct ProgressBarSizeDefault: ProgressBarSizeConfiguration {
    var height = CGFloat(4.0)
    var indicatorHeight = CGFloat(4.0)
    var indicatorPathDrawer = CircleDrawer() as PathDrawer
    var pathDrawer = CircleDrawer() as PathDrawer
    public var debugDescription: String {
        return "ProgressBarSize"
    }
}

struct ProgressBarAnySize: ProgressBarSizeConfiguration {
    var height = CGFloat(0)
    var indicatorHeight = CGFloat(0)
    var indicatorPathDrawer = DefaultPathDrawer() as PathDrawer
    var pathDrawer = DefaultPathDrawer() as PathDrawer

    init(size: ProgressBarSizeConfiguration) {
        self.height = size.height
        self.indicatorHeight = size.indicatorHeight
        self.indicatorPathDrawer = size.indicatorPathDrawer
        self.pathDrawer = size.pathDrawer
    }
    var debugDescription: String {
        return "ProgressBarAnySize"
    }
}
