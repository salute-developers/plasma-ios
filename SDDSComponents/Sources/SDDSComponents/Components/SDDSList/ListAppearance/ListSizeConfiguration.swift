import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol ListSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var gap: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingTop: CGFloat { get }
    var shape: PathDrawer { get }
}

public extension ListSizeConfiguration {
    var gap: CGFloat { 0 }
    var paddingBottom: CGFloat { 0 }
    var paddingEnd: CGFloat { 0 }
    var paddingStart: CGFloat { 0 }
    var paddingTop: CGFloat { 0 }
    var shape: PathDrawer { DefaultPathDrawer() }
}

public struct DefaultListSize: ListSizeConfiguration {
    public var debugDescription: String {
        "DefaultListSize"
    }
}

public struct ZeroListSize: ListSizeConfiguration {
    public var gap: CGFloat { 0 }
    public var paddingBottom: CGFloat { 0 }
    public var paddingEnd: CGFloat { 0 }
    public var paddingStart: CGFloat { 0 }
    public var paddingTop: CGFloat { 0 }
    public var shape: PathDrawer { DefaultPathDrawer() }
    
    public var debugDescription: String {
        "ZeroListSize"
    }
    
    public init() {}
} 