import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarIndicatorSize {
    static let l = AvatarIndicatorSizeL()
    static let m = AvatarIndicatorSizeM()
    static let s = AvatarIndicatorSizeS()

    static let all: [IndicatorSizeConfiguration] = [
        AvatarIndicatorSize.l,
        AvatarIndicatorSize.m,
        AvatarIndicatorSize.s,
    ] 
}
struct AvatarIndicatorSizeL: IndicatorSizeConfiguration {
    var height = CGFloat(12.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var width = CGFloat(12.0)
    public var debugDescription: String {
        return "AvatarIndicatorSize"
    }
}
struct AvatarIndicatorSizeM: IndicatorSizeConfiguration {
    var height = CGFloat(8.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var width = CGFloat(8.0)
    public var debugDescription: String {
        return "AvatarIndicatorSize"
    }
}
struct AvatarIndicatorSizeS: IndicatorSizeConfiguration {
    var height = CGFloat(6.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var width = CGFloat(6.0)
    public var debugDescription: String {
        return "AvatarIndicatorSize"
    }
}

struct AvatarIndicatorAnySize: IndicatorSizeConfiguration {
    var height = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var width = CGFloat(0)

    init(size: IndicatorSizeConfiguration) {
        self.height = size.height
        self.pathDrawer = size.pathDrawer
        self.width = size.width
    }
    var debugDescription: String {
        return "AvatarIndicatorAnySize"
    }
}
