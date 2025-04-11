import Foundation
import SwiftUI

public protocol SegmentItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var width: CGFloat { get }
    var counterPadding: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var iconSize: CGSize { get }
    var startContentSize: CGSize { get }
    var endContentSize: CGSize { get }
    var titleHorizontalGap: CGFloat { get }
    var iconHorizontalGap: CGFloat { get }
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
