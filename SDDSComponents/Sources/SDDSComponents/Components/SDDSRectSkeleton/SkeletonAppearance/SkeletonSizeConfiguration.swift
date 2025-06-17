import Foundation

public protocol SkeletonSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {}

public struct ZeroSkeletonSizeConfiguration: SkeletonSizeConfiguration {
    public var debugDescription: String {
        "ZeroSkeletonSizeConfiguration"
    }
    public init() {}
} 