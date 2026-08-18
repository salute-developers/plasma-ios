import SwiftUI
import Foundation
import SDDSThemeCore
import SDDSApiInfo

public protocol BadgeSizeConfiguration {
    var height: CGFloat { get }
    var startPadding: CGFloat { get }
    var endPadding: CGFloat { get }
    @ApiValue("size(startContentSize, startContentSize)")
    var startContentSize: CGSize { get }
    @ApiName("startContentMargin")
    var startContentPadding: CGFloat { get }
    @ApiValue("size(endContentSize, startContentSize)")
    var endContentSize: CGSize { get }
    @ApiName("endContentMargin")
    var endContentPadding: CGFloat { get }
    @ApiName("shape")
    var cornerRadius: CGFloat { get }
}

struct DefaultBadgeSize: BadgeSizeConfiguration {
    var height: CGFloat = 0
    var startPadding: CGFloat = 0
    var endPadding: CGFloat = 0
    var startContentSize: CGSize = .zero
    var startContentPadding: CGFloat = 0
    var endContentSize: CGSize = .zero
    var endContentPadding: CGFloat = 0
    var cornerRadius: CGFloat = 0
    
    init() {}
}
