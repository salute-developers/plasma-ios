import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct LinkButtonSize {
    static let l = LinkButtonSizeL()
    static let m = LinkButtonSizeM()
    static let s = LinkButtonSizeS()
    static let xl = LinkButtonSizeXl()
    static let xs = LinkButtonSizeXs()
    static let xxs = LinkButtonSizeXxs()

    static let all: [ButtonSizeConfiguration] = [
        LinkButtonSize.l,
        LinkButtonSize.m,
        LinkButtonSize.s,
        LinkButtonSize.xl,
        LinkButtonSize.xs,
        LinkButtonSize.xxs,
    ] 
}
struct LinkButtonSizeL: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(56.0)
    var iconHorizontalGap = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeM: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(48.0)
    var iconHorizontalGap = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeS: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(40.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeXl: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(64.0)
    var iconHorizontalGap = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeXs: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(32.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:16.0, height:16.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeXxs: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(24.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:12.0, height:12.0)
    var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    var spinnerSize = CGSize(width:12.0, height:12.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}

struct LinkButtonAnySize: ButtonSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var height = CGFloat(0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize.zero
    var paddings = EdgeInsets()
    var spinnerSize = CGSize.zero
    var titleHorizontalGap = CGFloat(0)

    init(size: ButtonSizeConfiguration) {
        self.cornerRadius = size.cornerRadius
        self.height = size.height
        self.iconHorizontalGap = size.iconHorizontalGap
        self.iconSize = size.iconSize
        self.paddings = size.paddings
        self.spinnerSize = size.spinnerSize
        self.titleHorizontalGap = size.titleHorizontalGap
    }
    var debugDescription: String {
        return "LinkButtonAnySize"
    }
}
