import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardSize {
    static let l = CardSizeL()
    static let m = CardSizeM()
    static let s = CardSizeS()
    static let xl = CardSizeXl()

    static let all: [CardSizeConfiguration] = [
        CardSize.l,
        CardSize.m,
        CardSize.s,
        CardSize.xl,
    ] 
}
struct CardSizeL: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "CardSize"
    }
}
struct CardSizeM: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "CardSize"
    }
}
struct CardSizeS: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "CardSize"
    }
}
struct CardSizeXl: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    public var debugDescription: String {
        return "CardSize"
    }
}

struct CardAnySize: CardSizeConfiguration {
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
        return "CardAnySize"
    }
}
