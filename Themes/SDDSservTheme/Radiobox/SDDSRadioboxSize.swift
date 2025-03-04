import Foundation
import SDDSComponents

public enum SDDSRadioboxSize: String, SelectionControlSizeConfiguration {
    case medium
    case small
    
    public var debugDescription: String {
        rawValue
    }
    
    public var imageSize: CGSize {
        switch self {
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
        case .medium:
            12.0
        case .small:
            8.0
        }
    }
}
