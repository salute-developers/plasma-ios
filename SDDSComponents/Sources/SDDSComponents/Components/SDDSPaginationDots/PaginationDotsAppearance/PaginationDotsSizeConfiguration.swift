import Foundation
import SwiftUI

public enum PaginationDotsOrientation {
    case horizontal
    case vertical
}

public protocol PaginationDotsSizeConfiguration {
    var dotHeight: CGFloat { get }
    var dotHeightActivated: CGFloat { get }
    var dotWidth: CGFloat { get }
    var dotWidthActivated: CGFloat { get }
    var edgeCount: Int { get }
    var edgeShrinkFactor: CGFloat { get }
    var gap: CGFloat { get }
    var orientation: PaginationDotsOrientation { get }
}

struct DefaultPaginationDotsSize: PaginationDotsSizeConfiguration {
    var dotHeight: CGFloat = 0
    var dotHeightActivated: CGFloat = 0
    var dotWidth: CGFloat = 0
    var dotWidthActivated: CGFloat = 0
    var edgeCount: Int = 0
    var edgeShrinkFactor: CGFloat = 0
    var gap: CGFloat = 0
    var orientation: PaginationDotsOrientation = .horizontal
    
    init() {}
}
