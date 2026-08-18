import Foundation
import SwiftUI
import SDDSApiInfo

public protocol SegmentItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    @ApiName("minHeight")
    var height: CGFloat { get }
    @ApiName("minWidth")
    var width: CGFloat { get }
    @ApiName("counterMargin")
    var counterPadding: CGFloat { get }
    @ApiName("shape")
    var cornerRadius: CGFloat { get }
    @ApiValue("size(startContentSize, startContentSize)")
    var iconSize: CGSize { get }
    @ApiValue("size(startContentSize, startContentSize)")
    var startContentSize: CGSize { get }
    @ApiValue("size(startContentSize, endContentSize)")
    var endContentSize: CGSize { get }
    @ApiName("valueMargin")
    var titleHorizontalGap: CGFloat { get }
    @ApiName("iconMargin")
    var iconHorizontalGap: CGFloat { get }
    @ApiValue("insets(_, paddingStart, _, paddingEnd)")
    var paddings: EdgeInsets { get }
}

public struct DefaultSegmentItemSize: SegmentItemSizeConfiguration {
    public var startContentSize: CGSize = .zero
    public var endContentSize: CGSize = .zero
    public var width: CGFloat = 0
    public var height: CGFloat = 0
    public var counterPadding: CGFloat = 0
    public var cornerRadius: CGFloat { 0 }
    public var paddings: EdgeInsets { .init() }
    public var iconSize: CGSize = .zero
    public var iconHorizontalGap: CGFloat = 0
    public var titleHorizontalGap: CGFloat = 0
    public var debugDescription: String {
        return "Default SegmentItem Size"
    }
    
    public init() {}
}
