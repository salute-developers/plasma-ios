import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconBadgeClearSize {
    static let l = IconBadgeClearSizeL()
    static let m = IconBadgeClearSizeM()
    static let s = IconBadgeClearSizeS()
    static let xs = IconBadgeClearSizeXs()

    static let all: [BadgeSizeConfiguration] = [
        IconBadgeClearSize.l,
        IconBadgeClearSize.m,
        IconBadgeClearSize.s,
        IconBadgeClearSize.xs,
    ] 
}
struct IconBadgeClearSizeL: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(6.0)
    var height = CGFloat(28.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:16.0, height:16.0)
    var startPadding = CGFloat(6.0)
    public var debugDescription: String {
        return "IconBadgeClearSize"
    }
}
struct IconBadgeClearSizeM: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(6.0)
    var height = CGFloat(24.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(6.0)
    public var debugDescription: String {
        return "IconBadgeClearSize"
    }
}
struct IconBadgeClearSizeS: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(4.0)
    var height = CGFloat(20.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:12.0, height:12.0)
    var startPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "IconBadgeClearSize"
    }
}
struct IconBadgeClearSizeXs: BadgeSizeConfiguration {
    var cornerRadius = ShapeToken.roundXxs.cornerRadius
    var endContentPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var endPadding = CGFloat(3.0)
    var height = CGFloat(16.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGSize(width:10.0, height:10.0)
    var startPadding = CGFloat(3.0)
    public var debugDescription: String {
        return "IconBadgeClearSize"
    }
}

struct IconBadgeClearAnySize: BadgeSizeConfiguration {
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
        return "IconBadgeClearAnySize"
    }
}
