import Foundation
import SDDSComponents
import SwiftUI

enum SegmentItemSize: String, CaseIterable {
    case extraLarge
    case large
    case medium
    case small
    case extraSmall
}

extension SegmentItemSize: SegmentItemSizeConfiguration {
    var cornerRadius: CGFloat {
        switch self {
        case .extraLarge: return ShapeToken.roundL.cornerRadius
        case .large: return ShapeToken.roundL.cornerRadius - 2.0
        case .medium: return ShapeToken.roundM.cornerRadius
        case .small: return ShapeToken.roundM.cornerRadius - 2.0
        case .extraSmall: return ShapeToken.roundS.cornerRadius
        }
    }
    
    var height: CGFloat {
        switch self {
        case .extraLarge: return 64
        case .large: return 56
        case .medium: return 48
        case .small: return 40
        case .extraSmall: return 32
        }
    }
    
    var paddings: EdgeInsets {
        switch self {
        case .extraLarge:
            return EdgeInsets(top: 0, leading: 28, bottom: 0, trailing: 28)
        case .large:
            return EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
        case .medium:
            return EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        case .small:
            return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        case .extraSmall:
            return EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        }
    }
    
    var iconSize: CGSize {
        switch self {
        case .extraLarge: return CGSize(width: 24, height: 24)
        case .large: return CGSize(width: 24, height: 24)
        case .medium: return CGSize(width: 24, height: 24)
        case .small: return CGSize(width: 24, height: 24)
        case .extraSmall: return CGSize(width: 16, height: 16)
        }
    }
    
    var spinnerSize: CGSize {
        CGSize(width: 0, height: 0)
    }
    
    var titleHorizontalGap: CGFloat {
        switch self {
        case .extraLarge: return 6
        case .large: return 6
        case .medium: return 4
        case .small: return 2
        case .extraSmall: return 2
        }
    }
    
    var iconHorizontalGap: CGFloat {
        switch self {
        case .extraLarge: return 6
        case .large: return 6
        case .medium: return 4
        case .small: return 2
        case .extraSmall: return 2
        }
    }
    
    var debugDescription: String {
        return "SegmentItemSize"
    }
}
