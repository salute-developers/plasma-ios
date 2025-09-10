import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct LinkButtonSize {
    static let l = LinkButtonSizeL()
    static let m = LinkButtonSizeM()
    static let s = LinkButtonSizeS()
    static let xs = LinkButtonSizeXs()

    static let all: [ButtonSizeConfiguration] = [
        LinkButtonSize.l,
        LinkButtonSize.m,
        LinkButtonSize.s,
        LinkButtonSize.xs,
    ] 
}
struct LinkButtonSizeL: ButtonSizeConfiguration {
    var height = CGFloat(56.0)
    var iconHorizontalGap = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeM: ButtonSizeConfiguration {
    var height = CGFloat(48.0)
    var iconHorizontalGap = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeS: ButtonSizeConfiguration {
    var height = CGFloat(40.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeXs: ButtonSizeConfiguration {
    var height = CGFloat(32.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spinnerSize = CGSize(width:16.0, height:16.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}

struct LinkButtonAnySize: ButtonSizeConfiguration {
    var height = CGFloat(0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize.zero
    var paddings = EdgeInsets()
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var spinnerSize = CGSize.zero
    var titleHorizontalGap = CGFloat(0)

    init(size: ButtonSizeConfiguration) {
        self.height = size.height
        self.iconHorizontalGap = size.iconHorizontalGap
        self.iconSize = size.iconSize
        self.paddings = size.paddings
        self.pathDrawer = size.pathDrawer
        self.spinnerSize = size.spinnerSize
        self.titleHorizontalGap = size.titleHorizontalGap
    }
    var debugDescription: String {
        return "LinkButtonAnySize"
    }
}
