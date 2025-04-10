import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct ProgressBarSize {

    static let all: [ProgressBarSizeConfiguration] = [
    ] 
}

struct ProgressBarAnySize: ProgressBarSizeConfiguration {
    var cornerRadius = DefaultPathDrawer() as PathDrawer
    var height = CGFloat(0)
    var indicatorCornerRadius = DefaultPathDrawer() as PathDrawer
    var indicatorHeight = CGFloat(0)

    init(size: ProgressBarSizeConfiguration) {
        self.cornerRadius = size.cornerRadius
        self.height = size.height
        self.indicatorCornerRadius = size.indicatorCornerRadius
        self.indicatorHeight = size.indicatorHeight
    }
    var debugDescription: String {
        return "ProgressBarAnySize"
    }
}
