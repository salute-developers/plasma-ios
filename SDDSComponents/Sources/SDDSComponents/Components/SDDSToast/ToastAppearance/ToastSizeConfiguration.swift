import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol ToastSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var contentStartSize: CGFloat { get }
    var contentEndSize: CGFloat { get }
    var contentStartPadding: CGFloat { get }
    var contentEndPadding: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var shape: PathDrawer { get }
}

public struct DefaultToastSize: ToastSizeConfiguration {
    public var contentStartSize: CGFloat { 16 }
    public var contentEndSize: CGFloat { 16 }
    public var contentStartPadding: CGFloat { 6 }
    public var contentEndPadding: CGFloat { 8 }
    public var paddingStart: CGFloat { 10 }
    public var paddingEnd: CGFloat { 12 }
    public var paddingTop: CGFloat { 8 }
    public var paddingBottom: CGFloat { 8 }
    public var shape: PathDrawer { CornerRadiusDrawer(cornerRadius: 12) }
    public var debugDescription: String { "DefaultToastSize" }
}

public struct ZeroToastSize: ToastSizeConfiguration {
    public var contentStartSize: CGFloat = 0
    public var contentEndSize: CGFloat = 0
    public var contentStartPadding: CGFloat = 0
    public var contentEndPadding: CGFloat = 0
    public var paddingStart: CGFloat = 0
    public var paddingEnd: CGFloat = 0
    public var paddingTop: CGFloat = 0
    public var paddingBottom: CGFloat = 0
    public var shape: PathDrawer = DefaultPathDrawer()
    public var debugDescription: String { "ZeroToastSize" }
    public init() {}
} 
