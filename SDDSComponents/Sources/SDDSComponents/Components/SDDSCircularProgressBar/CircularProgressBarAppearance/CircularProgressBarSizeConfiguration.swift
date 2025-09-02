import Foundation
import SwiftUI
import SDDSThemeCore

public protocol CircularProgressBarSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var trackThickness: CGFloat { get }
    var progressThickness: CGFloat { get }
}

public struct DefaultCircularProgressBarSize: CircularProgressBarSizeConfiguration {
    public var width: CGFloat
    public var height: CGFloat
    public var trackThickness: CGFloat
    public var progressThickness: CGFloat
    
    public var debugDescription: String {
        "DefaultCircularProgressBarSize"
    }
    
    public init(
        width: CGFloat = 88,
        height: CGFloat = 88,
        trackThickness: CGFloat = 4,
        progressThickness: CGFloat = 4
    ) {
        self.width = width
        self.height = height
        self.trackThickness = trackThickness
        self.progressThickness = progressThickness
    }
}

public struct ZeroCircularProgressBarSize: CircularProgressBarSizeConfiguration {
    public var width: CGFloat { 0 }
    public var height: CGFloat { 0 }
    public var trackThickness: CGFloat { 0 }
    public var progressThickness: CGFloat { 0 }
    
    public var debugDescription: String {
        "ZeroCircularProgressBarSize"
    }
    
    public init() {}
}
