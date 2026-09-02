import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct WheelSize {
    static let h1 = WheelSizeH1()
    static let h4 = WheelSizeH4()

    static let all: [WheelSizeConfiguration] = [
        WheelSize.h1,
        WheelSize.h4,
    ] 
}
struct WheelSizeH1: WheelSizeConfiguration {
    var controlIconDownSize = CGFloat(36)
    var controlIconUpSize = CGFloat(36)
    var descriptionPadding = CGFloat(8.0)
    var itemAlignment = WheelItemAlignment.start
    var itemMinSpacing = CGFloat(20.0)
    var itemTextAfterPadding = CGFloat(2.0)
    var selectionIndicatorEnabled = Bool(false)
    var selectionIndicatorPaddingBottom = CGFloat(0)
    var selectionIndicatorPaddingEnd = CGFloat(0)
    var selectionIndicatorPaddingStart = CGFloat(0)
    var selectionIndicatorPaddingTop = CGFloat(0)
    var selectionIndicatorShape = CGFloat(0)
    var separatorSpacing = CGFloat(40.0)
    public var debugDescription: String {
        return "WheelSize"
    }
}
struct WheelSizeH4: WheelSizeConfiguration {
    var controlIconDownSize = CGFloat(36)
    var controlIconUpSize = CGFloat(36)
    var descriptionPadding = CGFloat(6.0)
    var itemAlignment = WheelItemAlignment.start
    var itemMinSpacing = CGFloat(32.0)
    var itemTextAfterPadding = CGFloat(2.0)
    var selectionIndicatorEnabled = Bool(true)
    var selectionIndicatorPaddingBottom = CGFloat(16.0)
    var selectionIndicatorPaddingEnd = CGFloat(0.0)
    var selectionIndicatorPaddingStart = CGFloat(0.0)
    var selectionIndicatorPaddingTop = CGFloat(16.0)
    var selectionIndicatorShape = ShapeToken.roundXl.cornerRadius
    var separatorSpacing = CGFloat(24.0)
    public var debugDescription: String {
        return "WheelSize"
    }
}

struct WheelAnySize: WheelSizeConfiguration {
    var controlIconDownSize = CGFloat(0)
    var controlIconUpSize = CGFloat(0)
    var descriptionPadding = CGFloat(0)
    var itemAlignment = WheelItemAlignment.start
    var itemMinSpacing = CGFloat(0)
    var itemTextAfterPadding = CGFloat(0)
    var selectionIndicatorEnabled = Bool(false)
    var selectionIndicatorPaddingBottom = CGFloat(0)
    var selectionIndicatorPaddingEnd = CGFloat(0)
    var selectionIndicatorPaddingStart = CGFloat(0)
    var selectionIndicatorPaddingTop = CGFloat(0)
    var selectionIndicatorShape = CGFloat(0)
    var separatorSpacing = CGFloat(0)

    init(size: WheelSizeConfiguration) {
        self.controlIconDownSize = size.controlIconDownSize
        self.controlIconUpSize = size.controlIconUpSize
        self.descriptionPadding = size.descriptionPadding
        self.itemAlignment = size.itemAlignment
        self.itemMinSpacing = size.itemMinSpacing
        self.itemTextAfterPadding = size.itemTextAfterPadding
        self.selectionIndicatorEnabled = size.selectionIndicatorEnabled
        self.selectionIndicatorPaddingBottom = size.selectionIndicatorPaddingBottom
        self.selectionIndicatorPaddingEnd = size.selectionIndicatorPaddingEnd
        self.selectionIndicatorPaddingStart = size.selectionIndicatorPaddingStart
        self.selectionIndicatorPaddingTop = size.selectionIndicatorPaddingTop
        self.selectionIndicatorShape = size.selectionIndicatorShape
        self.separatorSpacing = size.separatorSpacing
    }
    var debugDescription: String {
        return "WheelAnySize"
    }
}
