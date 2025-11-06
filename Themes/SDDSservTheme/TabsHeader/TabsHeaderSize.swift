import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabsHeaderSize {
    static let h1 = TabsHeaderSizeH1()
    static let h2 = TabsHeaderSizeH2()
    static let h3 = TabsHeaderSizeH3()
    static let h4 = TabsHeaderSizeH4()
    static let h5 = TabsHeaderSizeH5()

    static let all: [TabsSizeConfiguration] = [
        TabsHeaderSize.h1,
        TabsHeaderSize.h2,
        TabsHeaderSize.h3,
        TabsHeaderSize.h4,
        TabsHeaderSize.h5,
    ] 
}
struct TabsHeaderSizeH1: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(false)
    var indicatorEnabled = Bool(false)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(56.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsHeaderSize"
    }
}
struct TabsHeaderSizeH2: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(false)
    var indicatorEnabled = Bool(false)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(40.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsHeaderSize"
    }
}
struct TabsHeaderSizeH3: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(false)
    var indicatorEnabled = Bool(false)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(36.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsHeaderSize"
    }
}
struct TabsHeaderSizeH4: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(false)
    var indicatorEnabled = Bool(false)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(32.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsHeaderSize"
    }
}
struct TabsHeaderSizeH5: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(false)
    var indicatorEnabled = Bool(false)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(28.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsHeaderSize"
    }
}

struct TabsHeaderAnySize: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(0)
    var minSpacing = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(0)

    init(size: TabsSizeConfiguration) {
        self.disclosureIconSize = size.disclosureIconSize
        self.dividerEnabled = size.dividerEnabled
        self.indicatorEnabled = size.indicatorEnabled
        self.indicatorThickness = size.indicatorThickness
        self.minSpacing = size.minSpacing
        self.orientation = size.orientation
        self.overflowIconSize = size.overflowIconSize
    }
    var debugDescription: String {
        return "TabsHeaderAnySize"
    }
}
