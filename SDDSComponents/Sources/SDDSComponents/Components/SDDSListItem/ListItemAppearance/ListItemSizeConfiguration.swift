import Foundation
import SwiftUI
import SDDSThemeCore

public protocol ListItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var contentPaddingEnd: CGFloat { get }
    var height: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingTop: CGFloat { get }
    var shape: PathDrawer { get }
}

public struct DefaultListItemSize: ListItemSizeConfiguration {
    public var contentPaddingEnd: CGFloat = 8.0
    public var height: CGFloat = 48.0
    public var paddingBottom: CGFloat = 12.0
    public var paddingEnd: CGFloat = 14.0
    public var paddingStart: CGFloat = 14.0
    public var paddingTop: CGFloat = 12.0
    public var shape: PathDrawer = CornerRadiusDrawer(cornerRadius: 12)
    
    public var debugDescription: String {
        "DefaultListItemSize"
    }
}

public struct ZeroListItemSize: ListItemSizeConfiguration {
    public var contentPaddingEnd: CGFloat {
        0
    }
    
    public var height: CGFloat {
        0
    }
    
    public var paddingBottom: CGFloat {
        0
    }
    
    public var paddingEnd: CGFloat {
        0
    }
    
    public var paddingStart: CGFloat {
        0
    }
    
    public var paddingTop: CGFloat {
        0
    }
    
    public var shape: PathDrawer {
        DefaultPathDrawer()
    }
    
    public var debugDescription: String {
        "ZeroListItemSize"
    }
    
    public init() {}
} 
