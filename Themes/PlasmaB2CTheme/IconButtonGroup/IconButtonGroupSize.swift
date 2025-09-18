import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconButtonGroupSize {
    static let l = IconButtonGroupSizeL()
    static let m = IconButtonGroupSizeM()
    static let s = IconButtonGroupSizeS()
    static let xs = IconButtonGroupSizeXs()

    static let all: [ButtonGroupSizeConfiguration] = [
        IconButtonGroupSize.l,
        IconButtonGroupSize.m,
        IconButtonGroupSize.s,
        IconButtonGroupSize.xs,
    ] 
}
struct IconButtonGroupSizeL: ButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeM: ButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeS: ButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeXs: ButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}

struct IconButtonGroupAnySize: ButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer
    var spacing = CGFloat(0)

    init(size: ButtonGroupSizeConfiguration) {
        self.externalShape = size.externalShape
        self.internalShape = size.internalShape
        self.spacing = size.spacing
    }
    var debugDescription: String {
        return "IconButtonGroupAnySize"
    }
}
