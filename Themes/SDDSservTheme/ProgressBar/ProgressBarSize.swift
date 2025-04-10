import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarSize {
    static let `default` = ProgressBarSizeDefault()

    static let all: [ProgressBarSizeConfiguration] = [
        ProgressBarSize.`default`,
    ] 
}
struct ProgressBarSizeDefault: ProgressBarSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(4.0)
    var indicatorCornerRadius = CGFloat(0)
    var indicatorHeight = CGFloat(4.0)
    var indicatorPathDrawer = CircleDrawer() as PathDrawer
    var pathDrawer = CircleDrawer() as PathDrawer
    public var debugDescription: String {
        return "ProgressBarSize"
    }
}

struct ProgressBarAnySize: ProgressBarSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(0)
    var indicatorCornerRadius = CGFloat(0)
    var indicatorHeight = CGFloat(0)
    var indicatorPathDrawer = DefaultPathDrawer() as PathDrawer
    var pathDrawer = DefaultPathDrawer() as PathDrawer

    init(size: ProgressBarSizeConfiguration) {
        self.cornerRadius = size.cornerRadius
        self.height = size.height
        self.indicatorCornerRadius = size.indicatorCornerRadius
        self.indicatorHeight = size.indicatorHeight
        self.indicatorPathDrawer = size.indicatorPathDrawer
        self.pathDrawer = size.pathDrawer
    }
    var debugDescription: String {
        return "ProgressBarAnySize"
    }
}
