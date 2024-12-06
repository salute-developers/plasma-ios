import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

public enum SDDSAvatarSize: AvatarSizeConfiguration {
    case extraExtraLarge
    case large
    case medium
    case small
    case scalable(height: CGFloat)
    
    public var avatarSize: CGSize {
        switch self {
        case .extraExtraLarge:
            return .init(width: 88, height: 88)
        case .large:
            return .init(width: 48, height: 48)
        case .medium:
            return .init(width: 36, height: 36)
        case .small:
            return .init(width: 24, height: 24)
        case .scalable(let height):
            return .init(width: height, height: height)
        }
        
    }
    
    public var statusSize: CGSize {
        switch self {
        case .extraExtraLarge:
            return .init(width: 12, height: 12)
        case .large:
            return .init(width: 8, height: 8)
        case .medium:
            return .init(width: 8, height: 8)
        case .small:
            return .init(width: 6, height: 6)
        case .scalable:
            return .zero
        }
    }
    
    public var statusInsets: EdgeInsets {
        switch self {
        case .extraExtraLarge:
            return EdgeInsets(top: 69, leading: 69, bottom: 0, trailing: 0)
        case .large:
            return EdgeInsets(top: 37, leading: 37, bottom: 0, trailing: 0)
        case .medium:
            return EdgeInsets(top: 26, leading: 26, bottom: 0, trailing: 0)
        case .small:
            return EdgeInsets(top: 18, leading: 18, bottom: 0, trailing: 0)
        case .scalable:
            return EdgeInsets()
        }
    }
}
