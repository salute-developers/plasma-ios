import Foundation
import SwiftUI

public protocol SegmentItemSizeConfiguration: ButtonSizeConfiguration, CustomDebugStringConvertible {}

public struct DefaultSegmentItemSize: SegmentItemSizeConfiguration {
    public var height: CGFloat = 0
    public var cornerRadius: CGFloat { 0 }
    public var paddings: EdgeInsets { .init() }
    public var iconSize: CGSize = .zero
    public var iconHorizontalGap: CGFloat = 0
    public var titleHorizontalGap: CGFloat = 0
    public var spinnerSize: CGSize = .zero
    public var debugDescription: String {
        return "Default SegmentItem Size"
    }
    
    public init() {}
}
