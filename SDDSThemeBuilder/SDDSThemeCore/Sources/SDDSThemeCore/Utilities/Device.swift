import Foundation
import UIKit

import UIKit

struct Device {
    enum Size {
        case small
        case medium
        case large
    }

    static var size: Size {
        let bounds: CGRect
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first(where: { $0.isKeyWindow }) ?? scene.windows.first {
            bounds = window.bounds
        } else {
            bounds = UIScreen.main.bounds
        }

        let logicalWidth = min(bounds.width, bounds.height)

        switch logicalWidth {
        case ..<560:
            return .small
        case 560..<960:
            return .medium
        default:
            return .large
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
