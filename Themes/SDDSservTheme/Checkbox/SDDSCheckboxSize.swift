import Foundation
import SwiftUI
import SDDSComponents

public enum SDDSCheckboxSize: String, SelectionControlSizeConfiguration, CaseIterable {
    case large
    case medium
    case small
    
    public var debugDescription: String {
        rawValue
    }
    
    public var verticalGap: CGFloat {
        0.0
    }
    
    public var horizontalGap: CGFloat {
        switch self {
        case .large:
            12.0
        case .medium:
            12.0
        case .small:
            8.0
        }
    }
    
    public var togglePathDrawer: PathDrawer {
        switch self {
        case .large:
            return CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        case .medium:
            return CornerRadiusDrawer(cornerRadius: ShapeToken.roundXs.cornerRadius) as PathDrawer
        case .small:
            return CornerRadiusDrawer(cornerRadius: ShapeToken.roundXxs.cornerRadius) as PathDrawer
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
            return 2
        case .medium:
            return 2
        case .small:
            return 1
        }
    }
    
    public var toggleCheckedIconWidth: CGFloat {
        switch self {
        case .large:
            return 9
        case .medium:
            return 9
        case .small:
            return 6
        }
    }
    
    public var toggleCheckedIconHeight: CGFloat {
        switch self {
        case .large:
            return 6
        case .medium:
            return 6
        case .small:
            return 4
        }
    }
    
    public var toggleIndeterminateIconWidth: CGFloat {
        switch self {
        case .large:
            return 12
        case .medium:
            return 12
        case .small:
            return 8
        }
    }
    
    public var toggleIndeterminateIconHeight: CGFloat {
        switch self {
        case .large:
            return 2
        case .medium:
            return 2
        case .small:
            return 2
        }
    }
}
