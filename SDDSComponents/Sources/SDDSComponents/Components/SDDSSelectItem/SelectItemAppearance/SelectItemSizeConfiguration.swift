import Foundation
import SwiftUI
import SDDSThemeCore

public protocol SelectItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var shape: PathDrawer { get }
    var height: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var controlMargin: CGFloat { get }
    var controlSize: CGFloat { get }
}

public struct ZeroSelectItemSize: SelectItemSizeConfiguration {
    public var shape: PathDrawer { DefaultPathDrawer() }
    public var height: CGFloat { 0 }
    public var paddingStart: CGFloat { 0 }
    public var paddingEnd: CGFloat { 0 }
    public var paddingTop: CGFloat { 0 }
    public var paddingBottom: CGFloat { 0 }
    public var controlMargin: CGFloat { 0 }
    public var controlSize: CGFloat { 0 }
    
    public var debugDescription: String {
        "ZeroSelectItemSize"
    }
    
    public init() {}
}

