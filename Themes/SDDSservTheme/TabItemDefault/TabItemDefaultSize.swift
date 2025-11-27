import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabItemDefaultSize {
    static let l = TabItemDefaultSizeL()
    static let m = TabItemDefaultSizeM()
    static let s = TabItemDefaultSizeS()
    static let xs = TabItemDefaultSizeXs()

    static let all: [TabItemSizeConfiguration] = [
        TabItemDefaultSize.l,
        TabItemDefaultSize.m,
        TabItemDefaultSize.s,
        TabItemDefaultSize.xs,
    ] 
}
struct TabItemDefaultSizeL: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(10.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(8.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(56.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var startContentPadding = CGFloat(8.0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(8.0)
    public var debugDescription: String {
        return "TabItemDefaultSize"
    }
}
struct TabItemDefaultSizeM: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(8.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(6.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(6.0)
    var minHeight = CGFloat(48.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(6.0)
    public var debugDescription: String {
        return "TabItemDefaultSize"
    }
}
struct TabItemDefaultSizeS: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(24)
    var actionPadding = CGFloat(6.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(4.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(24.0)
    var iconPadding = CGFloat(4.0)
    var minHeight = CGFloat(40.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(24.0)
    var valuePadding = CGFloat(4.0)
    public var debugDescription: String {
        return "TabItemDefaultSize"
    }
}
struct TabItemDefaultSizeXs: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(16)
    var actionPadding = CGFloat(4.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(4.0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(16.0)
    var iconPadding = CGFloat(4.0)
    var minHeight = CGFloat(32.0)
    var paddingEnd = CGFloat(0)
    var paddingStart = CGFloat(0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(16.0)
    var valuePadding = CGFloat(4.0)
    public var debugDescription: String {
        return "TabItemDefaultSize"
    }
}

struct TabItemDefaultAnySize: TabItemSizeConfiguration {
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
        return "TabItemDefaultAnySize"
    }
}
