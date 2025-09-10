import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct IconButtonGroupSize {
    static let l = IconButtonGroupSizeL()
    static let m = IconButtonGroupSizeM()
    static let s = IconButtonGroupSizeS()
    static let xs = IconButtonGroupSizeXs()

    static let all: [IconButtonGroupSizeConfiguration] = [
        IconButtonGroupSize.l,
        IconButtonGroupSize.m,
        IconButtonGroupSize.s,
        IconButtonGroupSize.xs,
    ] 
}
struct IconButtonGroupSizeL: IconButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeM: IconButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeS: IconButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}
struct IconButtonGroupSizeXs: IconButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "IconButtonGroupSize"
    }
}

struct IconButtonGroupAnySize: IconButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer
    var spacing = CGFloat(0)

    init(size: IconButtonGroupSizeConfiguration) {
        self.externalShape = size.externalShape
        self.internalShape = size.internalShape
        self.spacing = size.spacing
    }
    var debugDescription: String {
        return "IconButtonGroupAnySize"
    }
}
