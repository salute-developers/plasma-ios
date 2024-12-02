import Foundation
import SDDSComponents
import SwiftUI

public enum SegmentElementSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

extension SegmentElementSize: ButtonSizeConfiguration {

    public var height: CGFloat {
        switch self {
        case .large: return 56
        case .medium: return 48
        case .small: return 40
        case .extraSmall: return 32
        }
    }

    public var cornerRadius: CGFloat {
        switch self {
        case .large: return ShapeToken.roundL.cornerRadius - 2.0
        case .medium: return ShapeToken.roundM.cornerRadius
        case .small: return ShapeToken.roundM.cornerRadius - 2.0
        case .extraSmall: return ShapeToken.roundS.cornerRadius
        }
    }

    public var paddings: EdgeInsets {
        switch self {
        case .large: return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        case .medium: return EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        case .small: return EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        case .extraSmall: return EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        }
    }

    public var iconSize: CGSize {
        switch self {
        case .large: return CGSize(width: 20, height: 20)
        case .medium: return CGSize(width: 20, height: 20)
        case .small: return CGSize(width: 20, height: 20)
        case .extraSmall: return CGSize(width: 14, height: 14)
        }
    }

    public var spinnerSize: CGSize {
        CGSize(width: 0, height: 0)
    }

    public var titleHorizontalGap: CGFloat {
        switch self {
        case .large: return 6
        case .medium: return 4
        case .small: return 2
        case .extraSmall: return 2
        }
    }
        
    public var iconHorizontalGap: CGFloat {
        switch self {
        case .large: return 8
        case .medium: return 6
        case .small: return 4
        case .extraSmall: return 4
        }
    }

    public var debugDescription: String {
        return "SegmentElementSize"
    }
}
