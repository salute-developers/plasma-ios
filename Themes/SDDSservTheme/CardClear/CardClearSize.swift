import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardClearSize {
    static let l = CardClearSizeL()
    static let m = CardClearSizeM()
    static let s = CardClearSizeS()

    static let all: [CardSizeConfiguration] = [
        CardClearSize.l,
        CardClearSize.m,
        CardClearSize.s,
    ] 
}
struct CardClearSizeL: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "CardClearSize"
    }
}
struct CardClearSizeM: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius + 2.0) as PathDrawer
    public var debugDescription: String {
        return "CardClearSize"
    }
}
struct CardClearSizeS: CardSizeConfiguration {
    var paddingBottom = CGFloat(0.0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var paddingTop = CGFloat(0.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
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
