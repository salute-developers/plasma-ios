import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct PopoverSize {
    static let m = PopoverSizeM()
    static let s = PopoverSizeS()

    static let all: [PopoverSizeConfiguration] = [
        PopoverSize.m,
        PopoverSize.s,
    ] 
}
struct PopoverSizeM: PopoverSizeConfiguration {
    var offset = CGFloat(8.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundL.cornerRadius) as PathDrawer
    var tailHeight = CGFloat(8.0)
    var tailPadding = CGFloat(20.0)
    var tailWidth = CGFloat(20.0)
    var width = CGFloat(182.0)
    public var debugDescription: String {
        return "PopoverSize"
    }
}
struct PopoverSizeS: PopoverSizeConfiguration {
    var offset = CGFloat(8.0)
    var pathDrawer = CornerRadiusDrawer(cornerRadius: ShapeToken.roundM.cornerRadius) as PathDrawer
    var tailHeight = CGFloat(8.0)
    var tailPadding = CGFloat(16.0)
    var tailWidth = CGFloat(20.0)
    var width = CGFloat(182.0)
    public var debugDescription: String {
        return "PopoverSize"
    }
}

struct PopoverAnySize: PopoverSizeConfiguration {
    var offset = CGFloat(0)
    var pathDrawer = DefaultPathDrawer() as PathDrawer
    var tailHeight = CGFloat(0)
    var tailPadding = CGFloat(0)
    var tailWidth = CGFloat(0)
    var width = CGFloat(0)

    init(size: PopoverSizeConfiguration) {
        self.offset = size.offset
        self.pathDrawer = size.pathDrawer
        self.tailHeight = size.tailHeight
        self.tailPadding = size.tailPadding
        self.tailWidth = size.tailWidth
        self.width = size.width
    }
    var debugDescription: String {
        return "PopoverAnySize"
    }
}
