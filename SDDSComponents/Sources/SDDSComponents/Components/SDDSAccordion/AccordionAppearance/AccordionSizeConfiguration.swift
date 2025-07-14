import Foundation
import SwiftUI

public protocol AccordionSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var itemSpacing: CGFloat { get }
}

public struct DefaultAccordionSize: AccordionSizeConfiguration {
    public var itemSpacing: CGFloat = 8.0
    
    public var debugDescription: String {
        "DefaultAccordionSize"
    }
}

public struct ZeroAccordionSize: AccordionSizeConfiguration {
    public var itemSpacing: CGFloat {
        0
    }
    
    public var debugDescription: String {
        "ZeroAccordionSize"
    }
    
    public init() {}
} 