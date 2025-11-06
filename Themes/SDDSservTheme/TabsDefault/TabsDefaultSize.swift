import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct TabsDefaultSize {
    static let l = TabsDefaultSizeL()
    static let m = TabsDefaultSizeM()
    static let s = TabsDefaultSizeS()
    static let xs = TabsDefaultSizeXs()

    static let all: [TabsSizeConfiguration] = [
        TabsDefaultSize.l,
        TabsDefaultSize.m,
        TabsDefaultSize.s,
        TabsDefaultSize.xs,
    ] 
}
struct TabsDefaultSizeL: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsDefaultSize"
    }
}
struct TabsDefaultSizeM: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsDefaultSize"
    }
}
struct TabsDefaultSizeS: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsDefaultSize"
    }
}
struct TabsDefaultSizeXs: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(0)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "TabsDefaultSize"
    }
}

struct TabsDefaultAnySize: TabsSizeConfiguration {
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
        return "TabsDefaultAnySize"
    }
}
