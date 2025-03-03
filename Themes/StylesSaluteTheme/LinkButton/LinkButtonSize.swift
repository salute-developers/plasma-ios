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
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(56.0)
    public var iconHorizontalGap = CGFloat(8.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeM: ButtonSizeConfiguration {
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(48.0)
    public var iconHorizontalGap = CGFloat(6.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeS: ButtonSizeConfiguration {
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(40.0)
    public var iconHorizontalGap = CGFloat(4.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}
struct LinkButtonSizeXs: ButtonSizeConfiguration {
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(32.0)
    public var iconHorizontalGap = CGFloat(4.0)
    public var iconSize = CGSize(width:16.0, height:16.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 0.0)
    public var spinnerSize = CGSize(width:16.0, height:16.0)
    public var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "LinkButtonSize"
    }
}

struct LinkButtonAnySize: ButtonSizeConfiguration {
    public var cornerRadius = CGFloat(0)
    public var height = CGFloat(0)
    public var iconHorizontalGap = CGFloat(0)
    public var iconSize = CGSize.zero
    public var paddings = EdgeInsets()
    public var spinnerSize = CGSize.zero
    public var titleHorizontalGap = CGFloat(0)

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
