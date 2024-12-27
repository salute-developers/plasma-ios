import Foundation
import SwiftUI

public protocol SegmentElementSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    
    var cornerRadius: CGFloat { get }
    
    var paddings: EdgeInsets { get }
    
    var iconSize: CGSize { get }
    
    var iconHorizontalGap: CGFloat { get }
    
    var titleHorizontalGap: CGFloat { get }
}

public struct DefaultSegmentElementSize: SegmentElementSizeConfiguration {
    public var height: CGFloat = 0
    public var cornerRadius: CGFloat = 0
    public var paddings: EdgeInsets = .init()
    public var iconSize: CGSize = .zero
    public var iconHorizontalGap: CGFloat = 0
    public var titleHorizontalGap: CGFloat = 0
    
    public var debugDescription: String {
        return "Default SegmentElement Size"
    }
    
    public init() {}
}
