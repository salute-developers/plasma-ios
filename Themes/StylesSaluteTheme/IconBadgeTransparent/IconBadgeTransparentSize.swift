import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconBadgeTransparentSize {
    static let l = IconBadgeTransparentSizeL()
    static let m = IconBadgeTransparentSizeM()
    static let s = IconBadgeTransparentSizeS()
    static let xs = IconBadgeTransparentSizeXs()

    static let all: [BadgeSizeConfiguration] = [
        IconBadgeTransparentSize.l,
        IconBadgeTransparentSize.m,
        IconBadgeTransparentSize.s,
        IconBadgeTransparentSize.xs,
    ] 
}
struct IconBadgeTransparentSizeL: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(6.0)
    var height = CGFloat(28.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:16.0, height:16.0)
    var startPadding = CGFloat(6.0)
    public var debugDescription: String {
        return "IconBadgeTransparentSize"
    }
}
struct IconBadgeTransparentSizeM: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(6.0)
    var height = CGFloat(24.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(6.0)
    public var debugDescription: String {
        return "IconBadgeTransparentSize"
    }
}
struct IconBadgeTransparentSizeS: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(4.0)
    var height = CGFloat(20.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "IconBadgeTransparentSize"
    }
}
struct IconBadgeTransparentSizeXs: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXxs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(3.0)
    var height = CGFloat(16.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:10.0, height:10.0)
    var startPadding = CGFloat(3.0)
    public var debugDescription: String {
        return "IconBadgeTransparentSize"
    }
}

struct IconBadgeTransparentAnySize: BadgeSizeConfiguration {
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
        return "IconBadgeTransparentAnySize"
    }
}
