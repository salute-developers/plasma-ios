import Foundation
import SDDSComponents

enum SDDSRadioboxSize: String, SelectionControlSizeConfiguration {
    case medium
    case small
    
    var debugDescription: String {
        rawValue
    }
    
    var imageSize: CGSize {
        switch self {
        case .medium:
            .init(width: 24, height: 24)
        case .small:
            .init(width: 16, height: 16)
        }
    }
    
    var verticalGap: CGFloat {
        0.0
    }
    
    var horizontalGap: CGFloat {
        switch self {
        case .medium:
            12.0
        case .small:
            8.0
        }
    }
}
