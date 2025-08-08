import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol SpinnerSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var size: CGFloat { get }
    var padding: CGFloat { get }
    var angle: CGFloat { get }
}

public struct DefaultSpinnerSize: SpinnerSizeConfiguration {
    public var size: CGFloat
    public var padding: CGFloat
    public var angle: CGFloat
    
    public var debugDescription: String {
        "DefaultSpinnerSize"
    }
    
    public init(
        size: CGFloat = 48,
        padding: CGFloat = 4,
        angle: CGFloat = 360
    ) {
        self.size = size
        self.padding = padding
        self.angle = angle
    }
}

public struct ZeroSpinnerSize: SpinnerSizeConfiguration {
    public var size: CGFloat { 0 }
    public var padding: CGFloat { 0 }
    public var angle: CGFloat { 0 }
    
    public var debugDescription: String {
        "ZeroSpinnerSize"
    }
    
    public init() {}
} 
