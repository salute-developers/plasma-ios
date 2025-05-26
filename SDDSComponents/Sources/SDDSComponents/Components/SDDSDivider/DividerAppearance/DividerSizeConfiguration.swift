import Foundation

public protocol DividerSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {} 

public struct ZeroDividerSizeConfiguration: DividerSizeConfiguration {
    public var debugDescription: String {
        "ZeroDividerSizeConfiguration"
    }
    public init() {}
}
