import Foundation
import SDDSComponents

public enum SDDSChipSize: ChipSizeConfiguration {
    case large(ChipBorderStyle)
    case medium(ChipBorderStyle)
    case small(ChipBorderStyle)
    case extraSmall(ChipBorderStyle)
    
    public var debugDescription: String {
        switch self {
        case .large(let style):
            return "large\(style)"
        case .medium(let style):
            return "medium\(style)"
        case .small(let style):
            return "small\(style)"
        case .extraSmall(let style):
            return "extraSmall\(style)"
        }
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
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        case .extraSmall:
            return 10
        }
    }
    
    public var trailingInset: CGFloat {
        switch self {
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        case .extraSmall:
            return 10
        }
    }
    
    public var spacing: CGFloat {
        switch self {
        case .large:
            return 10
        case .medium:
            return 8
        case .small:
            return 6
        case .extraSmall:
            return 4
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 48
        case .medium:
            return 40
        case .small:
            return 32
        case .extraSmall:
            return 24
        }
    }
    
    public var borderStyle: ChipBorderStyle {
        switch self {
        case .large(let style):
            return style
        case .medium(let style):
            return style
        case .small(let style):
            return style
        case .extraSmall(let style):
            return style
        }
    }
    
    public var pilled: SDDSChipSize {
        switch self {
        case .large:
            return .large(.pilled)
        case .medium:
            return .medium(.pilled)
        case .small:
            return .small(.pilled)
        case .extraSmall:
            return .extraSmall(.pilled)
        }
    }
}

extension SDDSChipSize: Hashable {
    public static func == (lhs: SDDSChipSize, rhs: SDDSChipSize) -> Bool {
        return lhs.debugDescription == rhs.debugDescription
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(debugDescription)
    }
}
