import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct CardSolidSize {
    static let l = CardSolidSizeL()
    static let m = CardSolidSizeM()
    static let s = CardSolidSizeS()

    static let all: [CardSizeConfiguration] = [
        CardSolidSize.l,
        CardSolidSize.m,
        CardSolidSize.s,
    ] 
}
struct CardSolidSizeL: CardSizeConfiguration {
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "CardSolidSize"
    }
}
struct CardSolidSizeM: CardSizeConfiguration {
    var paddingBottom = CGFloat(10.0)
    var paddingEnd = CGFloat(10.0)
    var paddingStart = CGFloat(10.0)
    var paddingTop = CGFloat(10.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius-2.0) as PathDrawer
    public var debugDescription: String {
        return "CardSolidSize"
    }
}
struct CardSolidSizeS: CardSizeConfiguration {
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "CardSolidSize"
    }
}

struct CardSolidAnySize: CardSizeConfiguration {
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
        return "CardSolidAnySize"
    }
}
