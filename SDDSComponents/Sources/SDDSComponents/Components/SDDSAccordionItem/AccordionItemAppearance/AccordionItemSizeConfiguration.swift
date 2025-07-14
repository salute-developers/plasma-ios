import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public protocol AccordionItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var shape: PathDrawer { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var contentPaddingStart: CGFloat { get }
    var contentPaddingEnd: CGFloat { get }
    var contentPaddingBottom: CGFloat { get }
    var iconPadding: CGFloat { get }
    var iconPlacement: AccordionItemPlacement { get }
    var iconRotation: CGFloat { get }
}

public struct DefaultAccordionItemSize: AccordionItemSizeConfiguration {
    public var shape: PathDrawer = CornerRadiusDrawer(cornerRadius: 12)
    public var paddingStart: CGFloat = 14.0
    public var paddingEnd: CGFloat = 14.0
    public var paddingTop: CGFloat = 12.0
    public var paddingBottom: CGFloat = 12.0
    public var contentPaddingStart: CGFloat = 14.0
    public var contentPaddingEnd: CGFloat = 14.0
    public var contentPaddingBottom: CGFloat = 12.0
    public var iconPadding: CGFloat = 12.0
    public var iconPlacement: AccordionItemPlacement = .start
    public var iconRotation: CGFloat = 180.0
    
    public var debugDescription: String {
        "DefaultAccordionItemSize"
    }
}

public struct ZeroAccordionItemSize: AccordionItemSizeConfiguration {
    public var shape: PathDrawer {
        DefaultPathDrawer()
    }
    
    public var paddingStart: CGFloat {
        0
    }
    
    public var paddingEnd: CGFloat {
        0
    }
    
    public var paddingTop: CGFloat {
        0
    }
    
    public var paddingBottom: CGFloat {
        0
    }
    
    public var contentPaddingStart: CGFloat {
        0
    }
    
    public var contentPaddingEnd: CGFloat {
        0
    }
    
    public var contentPaddingBottom: CGFloat {
        0
    }
    
    public var iconPadding: CGFloat {
        0
    }
    
    public var iconPlacement: AccordionItemPlacement {
        .start
    }
    
    public var iconRotation: CGFloat {
        0
    }
    
    public var debugDescription: String {
        "ZeroAccordionItemSize"
    }
    
    public init() {}
}

public enum AccordionItemPlacement: String, CaseIterable {
    case start
    case end
} 