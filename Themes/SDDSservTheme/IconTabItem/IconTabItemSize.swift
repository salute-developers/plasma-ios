import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconTabItemSize {
    static let l = IconTabItemSizeL()
    static let m = IconTabItemSizeM()
    static let s = IconTabItemSizeS()
    static let xs = IconTabItemSizeXs()

    static let all: [TabItemSizeConfiguration] = [
        IconTabItemSize.l,
        IconTabItemSize.m,
        IconTabItemSize.s,
        IconTabItemSize.xs,
    ] 
}
struct IconTabItemSizeL: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(10.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(8.0)
    var counterOffsetY = CGFloat(8.0)
    var counterPadding = CGFloat(0.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(56.0)
    var paddingEnd = CGFloat(18.0)
    var paddingStart = CGFloat(18.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(0)
    public var debugDescription: String {
        return "IconTabItemSize"
    }
}
struct IconTabItemSizeM: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(8.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(8.0)
    var counterOffsetY = CGFloat(8.0)
    var counterPadding = CGFloat(6.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(48.0)
    var paddingEnd = CGFloat(14.0)
    var paddingStart = CGFloat(14.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(0)
    public var debugDescription: String {
        return "IconTabItemSize"
    }
}
struct IconTabItemSizeS: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(6.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(6.0)
    var counterOffsetY = CGFloat(6.0)
    var counterPadding = CGFloat(4.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(40.0)
    var paddingEnd = CGFloat(10.0)
    var paddingStart = CGFloat(10.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(0)
    public var debugDescription: String {
        return "IconTabItemSize"
    }
}
struct IconTabItemSizeXs: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(16)
    var actionPadding = CGFloat(4.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(6.0)
    var counterOffsetY = CGFloat(6.0)
    var counterPadding = CGFloat(4.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(16.0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(32.0)
    var paddingEnd = CGFloat(10.0)
    var paddingStart = CGFloat(10.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(16.0)
    var valuePadding = CGFloat(0)
    public var debugDescription: String {
        return "IconTabItemSize"
    }
}

struct IconTabItemAnySize: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(0)
    var actionPadding = CGFloat(0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(0)

    init(size: TabItemSizeConfiguration) {
        self.actionIconSize = size.actionIconSize
        self.actionPadding = size.actionPadding
        self.actionSize = size.actionSize
        self.counterOffsetX = size.counterOffsetX
        self.counterOffsetY = size.counterOffsetY
        self.counterPadding = size.counterPadding
        self.disableAlpha = size.disableAlpha
        self.endContentSize = size.endContentSize
        self.iconPadding = size.iconPadding
        self.minHeight = size.minHeight
        self.paddingEnd = size.paddingEnd
        self.paddingStart = size.paddingStart
        self.startContentPadding = size.startContentPadding
        self.startContentSize = size.startContentSize
        self.valuePadding = size.valuePadding
    }
    var debugDescription: String {
        return "IconTabItemAnySize"
    }
}
