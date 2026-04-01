import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct PaginationDotsVerticalSize {
    static let m = PaginationDotsVerticalSizeM()
    static let s = PaginationDotsVerticalSizeS()

    static let all: [PaginationDotsSizeConfiguration] = [
        PaginationDotsVerticalSize.m,
        PaginationDotsVerticalSize.s,
    ] 
}
struct PaginationDotsVerticalSizeM: PaginationDotsSizeConfiguration {
    var dotHeight = CGFloat(12.0)
    var dotHeightActivated = CGFloat(12.0)
    var dotWidth = CGFloat(12.0)
    var dotWidthActivated = CGFloat(12.0)
    var edgeCount = Int(2)
    var edgeShrinkFactor = CGFloat(0.3)
    var gap = CGFloat(8.0)
    var orientation = PaginationDotsOrientation.vertical
    public var debugDescription: String {
        return "PaginationDotsVerticalSize"
    }
}
struct PaginationDotsVerticalSizeS: PaginationDotsSizeConfiguration {
    var dotHeight = CGFloat(8.0)
    var dotHeightActivated = CGFloat(8.0)
    var dotWidth = CGFloat(8.0)
    var dotWidthActivated = CGFloat(8.0)
    var edgeCount = Int(1)
    var edgeShrinkFactor = CGFloat(0.3)
    var gap = CGFloat(8.0)
    var orientation = PaginationDotsOrientation.vertical
    public var debugDescription: String {
        return "PaginationDotsVerticalSize"
    }
}

struct PaginationDotsVerticalAnySize: PaginationDotsSizeConfiguration {
    var dotHeight = CGFloat(0)
    var dotHeightActivated = CGFloat(0)
    var dotWidth = CGFloat(0)
    var dotWidthActivated = CGFloat(0)
    var edgeCount = Int(0)
    var edgeShrinkFactor = CGFloat(0)
    var gap = CGFloat(0)
    var orientation = PaginationDotsOrientation.horizontal

    init(size: PaginationDotsSizeConfiguration) {
        self.dotHeight = size.dotHeight
        self.dotHeightActivated = size.dotHeightActivated
        self.dotWidth = size.dotWidth
        self.dotWidthActivated = size.dotWidthActivated
        self.edgeCount = size.edgeCount
        self.edgeShrinkFactor = size.edgeShrinkFactor
        self.gap = size.gap
        self.orientation = size.orientation
    }
    var debugDescription: String {
        return "PaginationDotsVerticalAnySize"
    }
}
