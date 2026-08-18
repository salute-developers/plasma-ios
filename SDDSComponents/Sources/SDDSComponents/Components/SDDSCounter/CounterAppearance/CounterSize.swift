import Foundation
import SwiftUI
import SDDSApiInfo

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
    @ApiName("minHeight")
    var height: CGFloat { get }
    @ApiName("minWidth")
    var width: CGFloat { get }
    @ApiValue("insets(paddingTop, paddingLeft, paddingBottom, paddingRight)")
    var paddings: EdgeInsets { get }
}
