import Foundation
import SwiftUI
import SDDSApiInfo

public protocol ImageSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    /// Width component of aspect ratio (e.g. 16 in 16:9).
    @ApiName("width")
    var ratioWidth: CGFloat { get }
    /// Height component of aspect ratio (e.g. 9 in 16:9).
    @ApiName("height")
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
