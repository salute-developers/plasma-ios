import Foundation
import SwiftUI

public protocol ImageSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    /// Width component of aspect ratio (e.g. 16 in 16:9).
    var ratioWidth: CGFloat { get }
    /// Height component of aspect ratio (e.g. 9 in 16:9).
    var ratioHeight: CGFloat { get }
}

public struct DefaultImageSize: ImageSizeConfiguration {
    public var ratioWidth: CGFloat = 1
    public var ratioHeight: CGFloat = 1

    public var debugDescription: String {
        "DefaultImageSize"
    }

    public init() {}
}
