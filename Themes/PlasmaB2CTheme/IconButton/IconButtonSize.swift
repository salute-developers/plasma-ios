import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconButtonSize {
    static let l = IconButtonSizeL()
    static let m = IconButtonSizeM()
    static let s = IconButtonSizeS()
    static let xs = IconButtonSizeXs()

    static let all: [ButtonSizeConfiguration] = [
        IconButtonSize.l,
        IconButtonSize.m,
        IconButtonSize.s,
        IconButtonSize.xs,
    ] 
}
struct IconButtonSizeL: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundL.cornerRadius
    var height = CGFloat(56.0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonSize"
    }
}
struct IconButtonSizeM: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var height = CGFloat(48.0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonSize"
    }
}
struct IconButtonSizeS: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var height = CGFloat(40.0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
    var spinnerSize = CGSize(width:22.0, height:22.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonSize"
    }
}
struct IconButtonSizeXs: ButtonSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var height = CGFloat(32.0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var paddings = EdgeInsets(top: 0.0, leading: 8.0, bottom: 0.0, trailing: 8.0)
    var spinnerSize = CGSize(width:16.0, height:16.0)
    var titleHorizontalGap = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonSize"
    }
}

struct IconButtonAnySize: ButtonSizeConfiguration {
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
        return "IconButtonAnySize"
    }
}
