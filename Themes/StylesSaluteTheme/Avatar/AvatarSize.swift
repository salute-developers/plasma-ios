import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct AvatarSize {
    static let l = AvatarSizeL()
    static let m = AvatarSizeM()
    static let s = AvatarSizeS()
    static let xxl = AvatarSizeXxl()

    static let all: [AvatarSizeConfiguration] = [
        AvatarSize.l,
        AvatarSize.m,
        AvatarSize.s,
        AvatarSize.xxl,
    ] 
}
struct AvatarSizeL: AvatarSizeConfiguration {
    var avatarSize = CGSize(width:48.0, height:48.0)
    var extraOffset = CGPoint(x:2.0, y:2.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 3.0, trailing: 1.0)
    public var debugDescription: String {
        return "AvatarSize"
    }
}
struct AvatarSizeM: AvatarSizeConfiguration {
    var avatarSize = CGSize(width:36.0, height:36.0)
    var extraOffset = CGPoint(x:2.0, y:2.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 2.0, trailing: 0.0)
    public var debugDescription: String {
        return "AvatarSize"
    }
}
struct AvatarSizeS: AvatarSizeConfiguration {
    var avatarSize = CGSize(width:24.0, height:24.0)
    var extraOffset = CGPoint(x:1.0, y:1.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    public var debugDescription: String {
        return "AvatarSize"
    }
}
struct AvatarSizeXxl: AvatarSizeConfiguration {
    var avatarSize = CGSize(width:88.0, height:88.0)
    var extraOffset = CGPoint(x:0.0, y:0.0)
    var pathDrawer = CircleDrawer() as PathDrawer
    var statusInsets = EdgeInsets(top: 0.0, leading: 0.0, bottom: 7.0, trailing: 1.0)
    public var debugDescription: String {
        return "AvatarSize"
    }
}

struct AvatarAnySize: AvatarSizeConfiguration {
    var avatarSize = CGSize.zero
    var extraOffset = CGPoint.zero
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var statusInsets = EdgeInsets()

    init(size: AvatarSizeConfiguration) {
        self.avatarSize = size.avatarSize
        self.extraOffset = size.extraOffset
        self.pathDrawer = size.pathDrawer
        self.statusInsets = size.statusInsets
    }
    var debugDescription: String {
        return "AvatarAnySize"
    }
}
