import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct WheelSize {
    static let h1 = WheelSizeH1()

    static let all: [WheelSizeConfiguration] = [
        WheelSize.h1,
    ] 
}
struct WheelSizeH1: WheelSizeConfiguration {
    var controlIconDownSize = CGFloat(36)
    var controlIconUpSize = CGFloat(36)
    var descriptionPadding = CGFloat(8.0)
    var itemAlignment = WheelItemAlignment.start
    var itemMinSpacing = CGFloat(20.0)
    var itemTextAfterPadding = CGFloat(2.0)
    var separatorSpacing = CGFloat(40.0)
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
    var separatorSpacing = CGFloat(0)

    init(size: WheelSizeConfiguration) {
        self.controlIconDownSize = size.controlIconDownSize
        self.controlIconUpSize = size.controlIconUpSize
        self.descriptionPadding = size.descriptionPadding
        self.itemAlignment = size.itemAlignment
        self.itemMinSpacing = size.itemMinSpacing
        self.itemTextAfterPadding = size.itemTextAfterPadding
        self.separatorSpacing = size.separatorSpacing
    }
    var debugDescription: String {
        return "WheelAnySize"
    }
}
