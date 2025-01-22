import Foundation
import SDDSComponents
import SDDSServTheme

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
        case .large: return 56
        case .medium: return 48
        case .small: return 40
        case .extraSmall: return 32
        }
    }
}


