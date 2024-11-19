import Foundation
import SDDSComponents
import SwiftUI

public enum LinkButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

extension LinkButtonSize: ButtonSizeConfiguration {
    public var height: CGFloat {
        switch self {
        case .large:
            return 56
        case .medium:
            return 48
        case .small:
            return 40
        case .extraSmall:
            return 32
        case .extraExtraSmall:
            return 24
        }
    }
    
    public var cornerRadius: CGFloat {
        return 0
    }
    
    public var paddings: EdgeInsets {
        switch self {
        case .large:
            return EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0)
        case .medium:
            return EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0)
        case .small:
            return EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0)
        case .extraSmall:
            return EdgeInsets(top: 11, leading: 0, bottom: 11, trailing: 0)
        case .extraExtraSmall:
            return EdgeInsets(top: 5, leading: 0, bottom: 5, trailing: 0)
        }
    }
    
    public var iconSize: CGSize {
        switch self {
        case .large, .medium, .small:
            return CGSize(width: 24, height: 24)
        case .extraSmall, .extraExtraSmall:
            return CGSize(width: 16, height: 16)
        }
    }
    
    public var spinnerSize: CGSize {
        switch self {
        case .large, .medium, .small:
            return CGSize(width: 22, height: 22)
        case .extraSmall:
            return CGSize(width: 16, height: 16)
        case .extraExtraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var iconHorizontalGap: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        case .extraSmall, .extraExtraSmall:
            return 2
        }
    }
    
    public var titleHorizontalGap: CGFloat {
        switch self {
        case .extraSmall, .extraExtraSmall:
            return 4
        default:
            return 6
        }
    }
    
    public var debugDescription: String {
        "LinkSize"
    }
}
