import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconTabsSize {
    static let l = IconTabsSizeL()
    static let m = IconTabsSizeM()
    static let s = IconTabsSizeS()
    static let xs = IconTabsSizeXs()

    static let all: [TabsSizeConfiguration] = [
        IconTabsSize.l,
        IconTabsSize.m,
        IconTabsSize.s,
        IconTabsSize.xs,
    ] 
}
struct IconTabsSizeL: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(24)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "IconTabsSize"
    }
}
struct IconTabsSizeM: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(24)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "IconTabsSize"
    }
}
struct IconTabsSizeS: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(24)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "IconTabsSize"
    }
}
struct IconTabsSizeXs: TabsSizeConfiguration {
    var disclosureIconSize = CGFloat(24)
    var dividerEnabled = Bool(true)
    var indicatorEnabled = Bool(true)
    var indicatorThickness = CGFloat(2.0)
    var minSpacing = CGFloat(0.0)
    var orientation = TabsOrientation.horizontal
    var overflowIconSize = CGFloat(24)
    public var debugDescription: String {
        return "IconTabsSize"
    }
}

struct IconTabsAnySize: TabsSizeConfiguration {
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
        return "IconTabsAnySize"
    }
}
