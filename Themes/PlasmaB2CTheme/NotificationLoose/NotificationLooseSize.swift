import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationLooseSize {
    static let l = NotificationLooseSizeL()
    static let m = NotificationLooseSizeM()
    static let s = NotificationLooseSizeS()

    static let all: [NotificationSizeConfiguration] = [
        NotificationLooseSize.l,
        NotificationLooseSize.m,
        NotificationLooseSize.s,
    ] 
}
struct NotificationLooseSizeL: NotificationSizeConfiguration {
    var closeSize = CGFloat(24.0)
    var paddingBottom = CGFloat(16.0)
    var paddingEnd = CGFloat(16.0)
    var paddingStart = CGFloat(16.0)
    var paddingTop = CGFloat(16.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "NotificationLooseSize"
    }
}
struct NotificationLooseSizeM: NotificationSizeConfiguration {
    var closeSize = CGFloat(16.0)
    var paddingBottom = CGFloat(14.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var paddingTop = CGFloat(14.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius - 2.0) as PathDrawer
    public var debugDescription: String {
        return "NotificationLooseSize"
    }
}
struct NotificationLooseSizeS: NotificationSizeConfiguration {
    var closeSize = CGFloat(16.0)
    var paddingBottom = CGFloat(12.0)
    var paddingEnd = CGFloat(12.0)
    var paddingStart = CGFloat(12.0)
    var paddingTop = CGFloat(12.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "NotificationLooseSize"
    }
}

struct NotificationLooseAnySize: NotificationSizeConfiguration {
    var closeSize = CGFloat(0)
    var paddingBottom = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var paddingTop = CGFloat(0)
    var shape = DefaultPathDrawer() as PathDrawer

    init(size: NotificationSizeConfiguration) {
        self.closeSize = size.closeSize
        self.paddingBottom = size.paddingBottom
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.paddingTop = size.paddingTop
        self.shape = size.shape
    }
    var debugDescription: String {
        return "NotificationLooseAnySize"
    }
}
