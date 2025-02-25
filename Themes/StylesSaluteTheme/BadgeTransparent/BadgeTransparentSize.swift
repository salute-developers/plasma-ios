import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BadgeTransparentSize {
    static let l = BadgeTransparentSizeL()
    static let m = BadgeTransparentSizeM()
    static let s = BadgeTransparentSizeS()
    static let xs = BadgeTransparentSizeXs()

    static let all: [BadgeSizeConfiguration] = [
        BadgeTransparentSize.l,
        BadgeTransparentSize.m,
        BadgeTransparentSize.s,
        BadgeTransparentSize.xs,
    ] 
}
struct BadgeTransparentSizeL: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var endContentPadding = CGFloat(16.0)
    var endContentSize = CGSize(width:16.0, height:16.0)
    var endPadding = CGFloat(11.0)
    var height = CGFloat(28.0)
    var startContentPadding = CGFloat(16.0)
    var startContentSize = CGSize(width:16.0, height:16.0)
    var startPadding = CGFloat(11.0)
    public var debugDescription: String {
        return "BadgeTransparentSize"
    }
}
struct BadgeTransparentSizeM: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(12.0)
    var endContentSize = CGSize(width:12.0, height:12.0)
    var endPadding = CGFloat(9.0)
    var height = CGFloat(24.0)
    var startContentPadding = CGFloat(12.0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(9.0)
    public var debugDescription: String {
        return "BadgeTransparentSize"
    }
}
struct BadgeTransparentSizeS: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(12.0)
    var endContentSize = CGSize(width:12.0, height:12.0)
    var endPadding = CGFloat(7.0)
    var height = CGFloat(20.0)
    var startContentPadding = CGFloat(12.0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(7.0)
    public var debugDescription: String {
        return "BadgeTransparentSize"
    }
}
struct BadgeTransparentSizeXs: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXxs.cornerRadius
    var endContentPadding = CGFloat(10.0)
    var endContentSize = CGSize(width:10.0, height:10.0)
    var endPadding = CGFloat(4.0)
    var height = CGFloat(16.0)
    var startContentPadding = CGFloat(10.0)
    var startContentSize = CGSize(width:10.0, height:10.0)
    var startPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "BadgeTransparentSize"
    }
}

struct BadgeTransparentAnySize: BadgeSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(0)
    var height = CGFloat(0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize.zero
    var startPadding = CGFloat(0)

    init(size: BadgeSizeConfiguration) {
        self.cornerRadius = size.cornerRadius
        self.endContentPadding = size.endContentPadding
        self.endContentSize = size.endContentSize
        self.endPadding = size.endPadding
        self.height = size.height
        self.startContentPadding = size.startContentPadding
        self.startContentSize = size.startContentSize
        self.startPadding = size.startPadding
    }
    var debugDescription: String {
        return "BadgeTransparentAnySize"
    }
}
