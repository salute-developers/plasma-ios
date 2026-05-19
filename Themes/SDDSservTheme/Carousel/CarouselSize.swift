import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CarouselSize {
    static let buttonsPlacementInner = CarouselSizeButtonsplacementinner()
    static let buttonsPlacementOuter = CarouselSizeButtonsplacementouter()

    static let all: [CarouselSizeConfiguration] = [
        CarouselSize.buttonsPlacementInner,
        CarouselSize.buttonsPlacementOuter,
    ] 
}
struct CarouselSizeButtonsplacementinner: CarouselSizeConfiguration {
    var buttonsPlacement = CarouselButtonsPlacement.inner
    var gap = CGFloat(0)
    var indicatorPadding = CGFloat(12.0)
    var nextButtonPadding = CGFloat(12.0)
    var prevButtonPadding = CGFloat(12.0)
    public var debugDescription: String {
        return "CarouselSize"
    }
}
struct CarouselSizeButtonsplacementouter: CarouselSizeConfiguration {
    var buttonsPlacement = CarouselButtonsPlacement.outer
    var gap = CGFloat(0)
    var indicatorPadding = CGFloat(12.0)
    var nextButtonPadding = CGFloat(12.0)
    var prevButtonPadding = CGFloat(12.0)
    public var debugDescription: String {
        return "CarouselSize"
    }
}

struct CarouselAnySize: CarouselSizeConfiguration {
    var buttonsPlacement = CarouselButtonsPlacement.inner
    var gap = CGFloat(0)
    var indicatorPadding = CGFloat(0)
    var nextButtonPadding = CGFloat(0)
    var prevButtonPadding = CGFloat(0)

    init(size: CarouselSizeConfiguration) {
        self.buttonsPlacement = size.buttonsPlacement
        self.gap = size.gap
        self.indicatorPadding = size.indicatorPadding
        self.nextButtonPadding = size.nextButtonPadding
        self.prevButtonPadding = size.prevButtonPadding
    }
    var debugDescription: String {
        return "CarouselAnySize"
    }
}
