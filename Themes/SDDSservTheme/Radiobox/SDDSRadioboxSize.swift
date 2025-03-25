import Foundation
import SDDSComponents

public enum SDDSRadioboxSize: String, SelectionControlSizeConfiguration {
    case large
    case medium
    case small
    
    public var debugDescription: String {
        rawValue
    }
    
    public var imageSize: CGSize {
        switch self {
        case .large:
            .init(width: 24, height: 24)
        case .medium:
            .init(width: 24, height: 24)
        case .small:
            .init(width: 16, height: 16)
        }
    }
    
    public var verticalGap: CGFloat {
        0.0
    }
    
    public var horizontalGap: CGFloat {
        switch self {
        case .large:
            12.0
        case .medium:
            10.0
        case .small:
            8.0
        }
    }
    
    public var togglePathDrawer: PathDrawer {
        switch self {
        case .large:
            return CircleDrawer() as PathDrawer
        case .medium:
            return CircleDrawer() as PathDrawer
        case .small:
            return CircleDrawer() as PathDrawer
        }
    }
    
    public var lineWidth: CGFloat {
        switch self {
        case .large:
            return 2
        case .medium:
            return 2
        case .small:
            return 1.5
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 24
        case .medium:
            return 24
        case .small:
            return 16
        }
    }
    
    public var width: CGFloat {
        switch self {
        case .large:
            return 24
        case .medium:
            return 24
        case .small:
            return 16
        }
    }
    
    public var togglePaddings: CGFloat {
        switch self {
        case .large:
            return 1
        case .medium:
            return 1
        case .small:
            return 0
        }
    }
    
    public var toggleCheckedIconWidth: CGFloat {
        switch self {
        case .large:
            return 10
        case .medium:
            return 10
        case .small:
            return 8
        }
    }
    
    public var toggleCheckedIconHeight: CGFloat {
        switch self {
        case .large:
            return 10
        case .medium:
            return 10
        case .small:
            return 8
        }
    }
    
    public var toggleIndeterminateIconWidth: CGFloat { 0 }
    
    public var toggleIndeterminateIconHeight: CGFloat { 0 }
}
