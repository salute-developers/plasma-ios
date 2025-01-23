import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

public enum SegmentSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

extension SegmentSize: SegmentSizeConfiguration {
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat {
        switch style {
        case .cornered:
            switch self {
            case .large: return ShapeToken.roundL.cornerRadius - 2.0
            case .medium: return ShapeToken.roundM.cornerRadius
            case .small: return ShapeToken.roundM.cornerRadius - 2.0
            case .extraSmall: return ShapeToken.roundS.cornerRadius
            }
        case .pilled:
            return height / 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large: return 60
        case .medium: return 52
        case .small: return 44
        case .extraSmall: return 36
        }
    }
    
    public var horizontalPaddings: CGFloat {
        switch self {
        case .large: return 2
        case .medium: return 2
        case .small: return 2
        case .extraSmall: return 2
        }
    }
}


