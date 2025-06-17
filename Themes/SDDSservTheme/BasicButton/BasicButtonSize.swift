import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonSize {
    static let l = BasicButtonSizeL()
    static let m = BasicButtonSizeM()
    static let s = BasicButtonSizeS()
    static let xl = BasicButtonSizeXl()
    static let xs = BasicButtonSizeXs()
    static let xxs = BasicButtonSizeXxs()

    static let all: [ButtonSizeConfiguration] = [
        BasicButtonSize.l,
        BasicButtonSize.m,
        BasicButtonSize.s,
        BasicButtonSize.xl,
        BasicButtonSize.xs,
        BasicButtonSize.xxs,
    ] 
}
struct BasicButtonSizeL: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundL.cornerRadius-2.0
    var height = CGFloat(56.0)
    var iconHorizontalGap = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeM: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var height = CGFloat(48.0)
    var iconHorizontalGap = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeS: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius-2.0
    var height = CGFloat(40.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeXl: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundL.cornerRadius
    var height = CGFloat(64.0)
    var iconHorizontalGap = CGFloat(8.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 28.0, bottom: 0.0, trailing: 28.0)
    var spinnerSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeXs: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var height = CGFloat(32.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
    var spinnerSize = CGSize(width:16.0, height:16.0)
    var titleHorizontalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeXxs: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var height = CGFloat(24.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:12.0, height:12.0)
    var paddings = EdgeInsets(top: 0.0, leading: 10.0, bottom: 0.0, trailing: 10.0)
    var spinnerSize = CGSize(width:12.0, height:12.0)
    var titleHorizontalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}

struct BasicButtonAnySize: ButtonSizeConfiguration {
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
        return "BasicButtonAnySize"
    }
}
