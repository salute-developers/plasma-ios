import Foundation
import SDDSComponents
import SwiftUI

public enum LinkButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

extension LinkButtonSize: ButtonSizeConfiguration {

    public var height: CGFloat {
        switch self {
        case .large: return 56
        case .medium: return 48
        case .small: return 40
        case .extraSmall: return 32
        }
    }

    public var cornerRadius: CGFloat {
        0
    }

    public var paddings: EdgeInsets {
        switch self {
        case .large: return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        case .medium: return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        case .small: return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        case .extraSmall: return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
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
        return "LinkButtonSize"
    }
}
