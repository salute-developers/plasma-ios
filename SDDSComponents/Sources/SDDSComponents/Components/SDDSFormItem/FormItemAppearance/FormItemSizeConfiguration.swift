import Foundation
import SwiftUI

public protocol FormItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var hintWidth: CGFloat { get }
    var hintHeight: CGFloat { get }
    var titleBlockWidth: CGFloat { get }
    var titleBlockPadding: CGFloat { get }
    var titleBlockSpacing: CGFloat { get }
    var titleCaptionPadding: CGFloat { get }
    var captionPadding: CGFloat { get }
    var counterPadding: CGFloat { get }
    var indicatorOffset: CGPoint { get }
}

public struct ZeroFormItemSize: FormItemSizeConfiguration {
    public var hintWidth: CGFloat { 0 }
    public var hintHeight: CGFloat { 0 }
    public var titleBlockWidth: CGFloat { 0 }
    public var titleBlockPadding: CGFloat { 0 }
    public var titleBlockSpacing: CGFloat { 0 }
    public var titleCaptionPadding: CGFloat { 0 }
    public var captionPadding: CGFloat { 0 }
    public var counterPadding: CGFloat { 0 }
    public var indicatorOffset: CGPoint { .zero }

    public init() {}

    public var debugDescription: String {
        "ZeroFormItemSize"
    }
}
