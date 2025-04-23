import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct SegmentSize {
    static let l = SegmentSizeL()
    static let m = SegmentSizeM()
    static let s = SegmentSizeS()
    static let xs = SegmentSizeXs()

    static let all: [SegmentSizeConfiguration] = [
        SegmentSize.l,
        SegmentSize.m,
        SegmentSize.s,
        SegmentSize.xs,
    ] 
}
struct SegmentSizeL: SegmentSizeConfiguration {
    var horizontalHeight = CGFloat(0)
    var paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius - 2.0) as PathDrawer
    var verticalWidth = CGFloat(0)
    public var debugDescription: String {
        return "SegmentSize"
    }
}
struct SegmentSizeM: SegmentSizeConfiguration {
    var horizontalHeight = CGFloat(0)
    var paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var verticalWidth = CGFloat(0)
    public var debugDescription: String {
        return "SegmentSize"
    }
}
struct SegmentSizeS: SegmentSizeConfiguration {
    var horizontalHeight = CGFloat(0)
    var paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius - 2.0) as PathDrawer
    var verticalWidth = CGFloat(0)
    public var debugDescription: String {
        return "SegmentSize"
    }
}
struct SegmentSizeXs: SegmentSizeConfiguration {
    var horizontalHeight = CGFloat(0)
    var paddings = EdgeInsets(top: 2.0, leading: 2.0, bottom: 2.0, trailing: 2.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var verticalWidth = CGFloat(0)
    public var debugDescription: String {
        return "SegmentSize"
    }
}

struct SegmentAnySize: SegmentSizeConfiguration {
    var horizontalHeight = CGFloat(0)
    var paddings = EdgeInsets()
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var verticalWidth = CGFloat(0)

    init(size: SegmentSizeConfiguration) {
        self.horizontalHeight = size.horizontalHeight
        self.paddings = size.paddings
        self.pathDrawer = size.pathDrawer
        self.verticalWidth = size.verticalWidth
    }
    var debugDescription: String {
        return "SegmentAnySize"
    }
}
