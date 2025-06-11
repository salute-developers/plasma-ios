import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationCompactSize {
    static let l = NotificationCompactSizeL()
    static let m = NotificationCompactSizeM()
    static let s = NotificationCompactSizeS()

    static let all: [NotificationSizeConfiguration] = [
        NotificationCompactSize.l,
        NotificationCompactSize.m,
        NotificationCompactSize.s,
    ] 
}
struct NotificationCompactSizeL: NotificationSizeConfiguration {
    var closeSize = CGFloat(24.0)
    var paddingBottom = CGFloat(8.0)
    var paddingEnd = CGFloat(8.0)
    var paddingStart = CGFloat(8.0)
    var paddingTop = CGFloat(8.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "NotificationCompactSize"
    }
}
struct NotificationCompactSizeM: NotificationSizeConfiguration {
    var closeSize = CGFloat(16.0)
    var paddingBottom = CGFloat(6.0)
    var paddingEnd = CGFloat(6.0)
    var paddingStart = CGFloat(6.0)
    var paddingTop = CGFloat(6.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius - 2.0) as PathDrawer
    public var debugDescription: String {
        return "NotificationCompactSize"
    }
}
struct NotificationCompactSizeS: NotificationSizeConfiguration {
    var closeSize = CGFloat(16.0)
    var paddingBottom = CGFloat(4.0)
    var paddingEnd = CGFloat(4.0)
    var paddingStart = CGFloat(4.0)
    var paddingTop = CGFloat(4.0)
    var shape = CornerRadiusDrawer(cornerRadius: ShapeToken.roundS.cornerRadius) as PathDrawer
    public var debugDescription: String {
        return "NotificationCompactSize"
    }
}

struct NotificationCompactAnySize: NotificationSizeConfiguration {
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
        return "NotificationCompactAnySize"
    }
}
