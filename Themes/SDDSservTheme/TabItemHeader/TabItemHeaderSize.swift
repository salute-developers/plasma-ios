import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabItemHeaderSize {
    static let h1 = TabItemHeaderSizeH1()
    static let h2 = TabItemHeaderSizeH2()
    static let h3 = TabItemHeaderSizeH3()
    static let h4 = TabItemHeaderSizeH4()
    static let h5 = TabItemHeaderSizeH5()

    static let all: [TabItemSizeConfiguration] = [
        TabItemHeaderSize.h1,
        TabItemHeaderSize.h2,
        TabItemHeaderSize.h3,
        TabItemHeaderSize.h4,
        TabItemHeaderSize.h5,
    ] 
}
struct TabItemHeaderSizeH1: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(36)
    var actionPadding = CGFloat(16.0)
    var actionSize = CGFloat(52.0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(16.0)
    public var debugDescription: String {
        return "TabItemHeaderSize"
    }
}
struct TabItemHeaderSizeH2: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(36)
    var actionPadding = CGFloat(12.0)
    var actionSize = CGFloat(0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(14.0)
    public var debugDescription: String {
        return "TabItemHeaderSize"
    }
}
struct TabItemHeaderSizeH3: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(36)
    var actionPadding = CGFloat(10.0)
    var actionSize = CGFloat(30.0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(12.0)
    public var debugDescription: String {
        return "TabItemHeaderSize"
    }
}
struct TabItemHeaderSizeH4: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(36)
    var actionPadding = CGFloat(8.0)
    var actionSize = CGFloat(26.0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(10.0)
    public var debugDescription: String {
        return "TabItemHeaderSize"
    }
}
struct TabItemHeaderSizeH5: TabItemSizeConfiguration {
    var actionIconSize = CGFloat(36)
    var actionPadding = CGFloat(8.0)
    var actionSize = CGFloat(24.0)
    var counterOffsetX = CGFloat(0)
    var counterOffsetY = CGFloat(0)
    var counterPadding = CGFloat(0)
    var disableAlpha = CGFloat(0.4)
    var endContentSize = CGFloat(0)
    var iconPadding = CGFloat(0)
    var minHeight = CGFloat(0)
    var paddingEnd = CGFloat(0.0)
    var paddingStart = CGFloat(0.0)
    var startContentPadding = CGFloat(0)
    var startContentSize = CGFloat(0)
    var valuePadding = CGFloat(10.0)
    public var debugDescription: String {
        return "TabItemHeaderSize"
    }
}

struct TabItemHeaderAnySize: TabItemSizeConfiguration {
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
        return "TabItemHeaderAnySize"
    }
}
