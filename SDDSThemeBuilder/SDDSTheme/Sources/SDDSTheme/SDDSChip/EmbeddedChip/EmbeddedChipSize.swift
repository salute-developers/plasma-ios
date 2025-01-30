import Foundation
import SwiftUI
import SDDSComponents

public enum EmbeddedChipSize: ChipSizeConfiguration {
    case large
    case medium
    case small
    case extraSmall
    
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var iconImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 24, height: 24)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var buttonImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 20, height: 20)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var leadingInset: CGFloat {
        switch self {
        case .large:
            return 14
        case .medium:
            return 12
        case .small:
            return 10
        case .extraSmall:
            return 6
        }
    }
    
    public var trailingInset: CGFloat {
        switch self {
        case .large:
            return 12
        case .medium:
            return 10
        case .small:
            return 8
        case .extraSmall:
            return 6
        }
    }
    
    public var spacing: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        case .extraSmall:
            return 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 44
        case .medium:
            return 36
        case .small:
            return 28
        case .extraSmall:
            return 20
        }
    }
    
    public func cornerRadius(style: SDDSComponents.ComponentShapeStyle) -> CGFloat {
        switch style {
        case .cornered:
            switch self {
            case .large:
                return 8
            case .medium:
                return 6
            case .small:
                return 4
            case .extraSmall:
                return 2
            }
        case .pilled:
            return height / 2
        }
    }
}
