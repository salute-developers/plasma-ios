import Foundation
import SwiftUI

public struct DefaultCounterSize: CounterSizeConfiguration {
    public var height: CGFloat = 0
    public var width: CGFloat = 0
    public var paddings: EdgeInsets = .init()
    public var debugDescription: String {
        return "DefaultCounterSize"
    }
    
    public init() {}
}

public protocol CounterSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var width: CGFloat { get }
    var paddings: EdgeInsets { get }
}
