import Foundation
import SDDSComponents
import SwiftUI

public enum IconButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

extension IconButtonSize: ButtonSizeConfiguration {

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
        switch self {
        case .large:
            return 14
        case .medium:
            return 12
        case .small:
            return 10
        case .extraSmall:
            return 8
        case .extraExtraSmall:
            return 6
        }
    }
    
    public var paddings: EdgeInsets {
        switch self {
        case .large:
            return EdgeInsets(top: 11, leading: 22, bottom: 11, trailing: 24)
        case .medium:
            return EdgeInsets(top: 11, leading: 20, bottom: 11, trailing: 20)
        case .small:
            return EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16)
        case .extraSmall:
            return EdgeInsets(top: 11, leading: 12, bottom: 11, trailing: 12)
        case .extraExtraSmall:
            return EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
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
    
    public var titleHorizontalGap: CGFloat {
        switch self {
        case .extraSmall, .extraExtraSmall:
            return 4
        default:
            return 6
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
    
    public var debugDescription: String {
        return "ButtonSize"
    }
}
