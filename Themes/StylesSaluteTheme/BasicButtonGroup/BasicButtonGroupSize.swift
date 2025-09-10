import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct BasicButtonGroupSize {
    static let l = BasicButtonGroupSizeL()
    static let m = BasicButtonGroupSizeM()
    static let s = BasicButtonGroupSizeS()
    static let xs = BasicButtonGroupSizeXs()

    static let all: [BasicButtonGroupSizeConfiguration] = [
        BasicButtonGroupSize.l,
        BasicButtonGroupSize.m,
        BasicButtonGroupSize.s,
        BasicButtonGroupSize.xs,
    ] 
}
struct BasicButtonGroupSizeL: BasicButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "BasicButtonGroupSize"
    }
}
struct BasicButtonGroupSizeM: BasicButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "BasicButtonGroupSize"
    }
}
struct BasicButtonGroupSizeS: BasicButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "BasicButtonGroupSize"
    }
}
struct BasicButtonGroupSizeXs: BasicButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer as PathDrawer
    var spacing = CGFloat(0)
    public var debugDescription: String {
        return "BasicButtonGroupSize"
    }
}

struct BasicButtonGroupAnySize: BasicButtonGroupSizeConfiguration {
    var externalShape = DefaultPathDrawer() as PathDrawer
    var internalShape = DefaultPathDrawer() as PathDrawer
    var spacing = CGFloat(0)

    init(size: BasicButtonGroupSizeConfiguration) {
        self.externalShape = size.externalShape
        self.internalShape = size.internalShape
        self.spacing = size.spacing
    }
    var debugDescription: String {
        return "BasicButtonGroupAnySize"
    }
}
