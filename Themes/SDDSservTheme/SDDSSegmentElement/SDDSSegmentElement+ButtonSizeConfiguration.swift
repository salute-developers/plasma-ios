import Foundation
import SDDSComponents
import SwiftUI

public enum SegmentElementSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
}

extension SegmentElementSize: SegmentElementSizeConfiguration {
    public func cornerRadius(style: ComponentShapeStyle) -> CGFloat {
        switch style {
        case .cornered:
            switch self {
            case .large: return ShapeToken.roundL.cornerRadius - 2.0
            case .medium: return ShapeToken.roundM.cornerRadius
            case .small: return ShapeToken.roundM.cornerRadius - 2.0
            case .extraSmall: return ShapeToken.roundS.cornerRadius
            }
        case .pilled:
            return height / 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large: return 56
        case .medium: return 48
        case .small: return 40
        case .extraSmall: return 32
        }
    }
    
    public func paddings(style: ComponentShapeStyle) -> EdgeInsets {
        switch style {
        case .cornered:
            switch self {
            case .large:
                return EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24)
            case .medium:
                return EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20)
            case .small:
                return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            case .extraSmall:
                return EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
            }
        case .pilled:
            switch self {
            case .large:
                return EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
            case .medium:
                return EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 12)
            case .small:
                return EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            case .extraSmall:
                return EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
            }
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
    
    public var counterSize: CounterSizeConfiguration {
        switch self {
        case .large: return CounterSize.small
        case .medium: return CounterSize.extraSmall
        case .small: return CounterSize.extraSmall
        case .extraSmall: return CounterSize.extraExtraSmall
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
        case .large: return 6
        case .medium: return 4
        case .small: return 2
        case .extraSmall: return 2
        }
    }
    
    public var debugDescription: String {
        return "SegmentElementSize"
    }
}
