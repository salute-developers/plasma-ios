import Foundation
import UIKit

struct Device {
    enum Size {
        case small
        case medium
        case large
    }
    
    static var size: Size {
        let height = UIScreen.main.bounds.height
        if height >= 960 {
            return .large
        } else if height < 960 && height > 560 {
            return .medium
        } else {
            return .small
        }
    }
}

extension Device.Size {
    var adaptiveStyle: AdaptiveStyle {
        switch self {
        case .small:
            return .small
        case .medium:
            return .medium
        case .large:
            return .large
        }
    }
}
