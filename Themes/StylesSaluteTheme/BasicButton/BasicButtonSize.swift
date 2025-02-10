import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonSize {
    static let l = BasicButtonSizeL()
    static let m = BasicButtonSizeM()
    static let s = BasicButtonSizeS()
    static let xs = BasicButtonSizeXs()

    static let all: [ButtonSizeConfiguration] = [
        BasicButtonSize.l,
        BasicButtonSize.m,
        BasicButtonSize.s,
        BasicButtonSize.xs,
    ] 
}
struct BasicButtonSizeL: ButtonSizeConfiguration {
    public var cornerRadius = ShapeToken.roundL.cornerRadius
    public var height = CGFloat(56.0)
    public var iconHorizontalGap = CGFloat(8.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeM: ButtonSizeConfiguration {
    public var cornerRadius = ShapeToken.roundM.cornerRadius
    public var height = CGFloat(48.0)
    public var iconHorizontalGap = CGFloat(6.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeS: ButtonSizeConfiguration {
    public var cornerRadius = ShapeToken.roundM.cornerRadius
    public var height = CGFloat(40.0)
    public var iconHorizontalGap = CGFloat(4.0)
    public var iconSize = CGSize(width:24.0, height:24.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
    public var spinnerSize = CGSize(width:22.0, height:22.0)
    public var titleHorizontalGap = CGFloat(4.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}
struct BasicButtonSizeXs: ButtonSizeConfiguration {
    public var cornerRadius = ShapeToken.roundS.cornerRadius
    public var height = CGFloat(32.0)
    public var iconHorizontalGap = CGFloat(4.0)
    public var iconSize = CGSize(width:16.0, height:16.0)
    public var paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
    public var spinnerSize = CGSize(width:16.0, height:16.0)
    public var titleHorizontalGap = CGFloat(2.0)
    public var debugDescription: String {
        return "BasicButtonSize"
    }
}

struct BasicButtonAnySize: ButtonSizeConfiguration {
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
        return "BasicButtonAnySize"
    }
}
