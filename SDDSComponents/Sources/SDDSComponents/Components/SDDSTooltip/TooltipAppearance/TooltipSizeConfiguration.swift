import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol TooltipSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var offset: CGFloat { get }
    var pathDrawer: PathDrawer { get }
    var tailHeight: CGFloat { get }
    var tailWidth: CGFloat { get }
    var tailPadding: CGFloat { get }
    var contentStartPadding: CGFloat { get }
    var contentStartSize: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
}

public struct DefaultTooltipSize: TooltipSizeConfiguration {
    public var offset: CGFloat { 0 }
    public var pathDrawer: PathDrawer { CornerRadiusDrawer(cornerRadius: 12) }
    public var tailHeight: CGFloat { 8 }
    public var tailWidth: CGFloat { 20 }
    public var tailPadding: CGFloat { 10 }
    public var contentStartPadding: CGFloat { 6 }
    public var contentStartSize: CGFloat { 16 }
    public var paddingStart: CGFloat { 14 }
    public var paddingEnd: CGFloat { 14 }
    public var paddingTop: CGFloat { 11 }
    public var paddingBottom: CGFloat { 11 }
    public var debugDescription: String { "DefaultTooltipSize" }
}

public struct ZeroTooltipSize: TooltipSizeConfiguration {
    public var offset: CGFloat { 0 }
    public var pathDrawer: PathDrawer { DefaultPathDrawer() }
    public var tailHeight: CGFloat { 0 }
    public var tailWidth: CGFloat { 0 }
    public var tailPadding: CGFloat { 0 }
    public var contentStartPadding: CGFloat { 0 }
    public var contentStartSize: CGFloat { 0 }
    public var paddingStart: CGFloat { 0 }
    public var paddingEnd: CGFloat { 0 }
    public var paddingTop: CGFloat { 0 }
    public var paddingBottom: CGFloat { 0 }
    public var debugDescription: String { "ZeroTooltipSize" }
    public init() {}
} 
