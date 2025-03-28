import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentItemSize {
    static let l = SegmentItemSizeL()
    static let m = SegmentItemSizeM()
    static let s = SegmentItemSizeS()
    static let xl = SegmentItemSizeXl()
    static let xs = SegmentItemSizeXs()

    static let all: [SegmentItemSizeConfiguration] = [
        SegmentItemSize.l,
        SegmentItemSize.m,
        SegmentItemSize.s,
        SegmentItemSize.xl,
        SegmentItemSize.xs,
    ] 
}
struct SegmentItemSizeL: SegmentItemSizeConfiguration {
    var cornerRadius = ShapeToken.roundL.cornerRadius
    var counterPadding = CGFloat(6.0)
    var endContentSize = CGSize(width:24.0, height:24.0)
    var height = CGFloat(56.0)
    var iconHorizontalGap = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 24.0, bottom: 0.0, trailing: 24.0)
    var startContentSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(6.0)
    var width = CGFloat(102.0)
    public var debugDescription: String {
        return "SegmentItemSize"
    }
}
struct SegmentItemSizeM: SegmentItemSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var counterPadding = CGFloat(4.0)
    var endContentSize = CGSize(width:24.0, height:24.0)
    var height = CGFloat(48.0)
    var iconHorizontalGap = CGFloat(4.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 20.0, bottom: 0.0, trailing: 20.0)
    var startContentSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(4.0)
    var width = CGFloat(88.0)
    public var debugDescription: String {
        return "SegmentItemSize"
    }
}
struct SegmentItemSizeS: SegmentItemSizeConfiguration {
    var cornerRadius = ShapeToken.roundM.cornerRadius
    var counterPadding = CGFloat(2.0)
    var endContentSize = CGSize(width:24.0, height:24.0)
    var height = CGFloat(40.0)
    var iconHorizontalGap = CGFloat(2.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 16.0, bottom: 0.0, trailing: 16.0)
    var startContentSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(2.0)
    var width = CGFloat(75.0)
    public var debugDescription: String {
        return "SegmentItemSize"
    }
}
struct SegmentItemSizeXl: SegmentItemSizeConfiguration {
    var cornerRadius = ShapeToken.roundL.cornerRadius
    var counterPadding = CGFloat(6.0)
    var endContentSize = CGSize(width:24.0, height:24.0)
    var height = CGFloat(64.0)
    var iconHorizontalGap = CGFloat(6.0)
    var iconSize = CGSize(width:24.0, height:24.0)
    var paddings = EdgeInsets(top: 0.0, leading: 28.0, bottom: 0.0, trailing: 28.0)
    var startContentSize = CGSize(width:24.0, height:24.0)
    var titleHorizontalGap = CGFloat(6.0)
    var width = CGFloat(110.0)
    public var debugDescription: String {
        return "SegmentItemSize"
    }
}
struct SegmentItemSizeXs: SegmentItemSizeConfiguration {
    var cornerRadius = ShapeToken.roundS.cornerRadius
    var counterPadding = CGFloat(2.0)
    var endContentSize = CGSize(width:16.0, height:16.0)
    var height = CGFloat(32.0)
    var iconHorizontalGap = CGFloat(2.0)
    var iconSize = CGSize(width:16.0, height:16.0)
    var paddings = EdgeInsets(top: 0.0, leading: 12.0, bottom: 0.0, trailing: 12.0)
    var startContentSize = CGSize(width:16.0, height:16.0)
    var titleHorizontalGap = CGFloat(2.0)
    var width = CGFloat(61.0)
    public var debugDescription: String {
        return "SegmentItemSize"
    }
}

struct SegmentItemAnySize: SegmentItemSizeConfiguration {
    var cornerRadius = CGFloat(0)
    var counterPadding = CGFloat(0)
    var endContentSize = CGSize.zero
    var height = CGFloat(0)
    var iconHorizontalGap = CGFloat(0)
    var iconSize = CGSize.zero
    var paddings = EdgeInsets()
    var startContentSize = CGSize.zero
    var titleHorizontalGap = CGFloat(0)
    var width = CGFloat(0)

    init(size: SegmentItemSizeConfiguration) {
        self.cornerRadius = size.cornerRadius
        self.counterPadding = size.counterPadding
        self.endContentSize = size.endContentSize
        self.height = size.height
        self.iconHorizontalGap = size.iconHorizontalGap
        self.iconSize = size.iconSize
        self.paddings = size.paddings
        self.startContentSize = size.startContentSize
        self.titleHorizontalGap = size.titleHorizontalGap
        self.width = size.width
    }
    var debugDescription: String {
        return "SegmentItemAnySize"
    }
}
