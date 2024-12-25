import Foundation
import SwiftUI

public protocol SegmentElementSizeConfiguration: ButtonSizeConfiguration, CustomDebugStringConvertible {}

public struct DefaultSegmentElementSize: SegmentElementSizeConfiguration {
    public var height: CGFloat = 0
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat { 0 }
    public func paddings(style: ComponentShapeStyle) -> EdgeInsets { .init() }
    public var iconSize: CGSize = .zero
    public var counterSize: CounterSizeConfiguration = DefaultCounterSize()
    public var iconHorizontalGap: CGFloat = 0
    public var titleHorizontalGap: CGFloat = 0
    public var spinnerSize: CGSize = .zero
    
    public var debugDescription: String {
        return "Default SegmentElement Size"
    }
    
    public init() {}
}
