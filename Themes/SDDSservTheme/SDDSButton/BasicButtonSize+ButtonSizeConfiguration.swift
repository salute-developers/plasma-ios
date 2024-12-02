import Foundation
import SDDSComponents
import SwiftUI

public enum BasicButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

extension BasicButtonSize: ButtonSizeConfiguration {

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
        case .large: return EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
        case .medium: return EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
        case .small: return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        case .extraSmall: return EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
        }
    }

    public var iconSize: CGSize {
        switch self {
        case .large: return CGSize(width: 24, height: 24)
        case .medium: return CGSize(width: 24, height: 24)
        case .small: return CGSize(width: 24, height: 24)
        case .extraSmall: return CGSize(width: 16, height: 16)
        }
    }

    public var spinnerSize: CGSize {
        switch self {
        case .large: return CGSize(width: 22, height: 22)
        case .medium: return CGSize(width: 22, height: 22)
        case .small: return CGSize(width: 22, height: 22)
        case .extraSmall: return CGSize(width: 16, height: 16)
        }
    }

    public var titleHorizontalGap: CGFloat {
        switch self {
        case .large: return 4
        case .medium: return 4
        case .small: return 4
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
        return "BasicButtonSize"
    }
}
