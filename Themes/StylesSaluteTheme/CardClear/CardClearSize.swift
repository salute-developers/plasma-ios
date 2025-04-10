import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardClearSize {
    static let Default = CardClearSizeDefault()

    static let all: [CardSizeConfiguration] = [
        CardClearSize.Default,
    ] 
}
struct CardClearSizeDefault: CardSizeConfiguration {
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "CardClearSize"
    }
}

struct CardClearAnySize: CardSizeConfiguration {
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer

    init(size: CardSizeConfiguration) {
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.pathDrawer = size.pathDrawer
    }
    var debugDescription: String {
        return "CardClearAnySize"
    }
}
