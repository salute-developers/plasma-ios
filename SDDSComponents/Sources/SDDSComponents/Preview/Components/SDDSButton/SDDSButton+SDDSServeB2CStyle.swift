import Foundation


extension SDDSServeB2CStyle {
    public var defaultButtonAppearance: ButtonAppearance {
        switch self {
        case .default:
            return .default
        case .secondary:
            return .secondary
        case .accent:
            return .accent
        case .positive:
            return .positive
        case .negative:
            return .negative
        case .warning:
            return .warning
        case .clear:
            return .clear
        case .dark:
            return .dark
        case .black:
            return .black
        }
    }
    
    public var defaultLinkButtonAppearance: ButtonAppearance {
        switch self {
        case .default:
            return .linkDefault
        case .secondary:
            return .linkSecondary
        case .accent:
            return .linkAccent
        case .positive:
            return .linkPositive
        case .negative:
            return .linkNegative
        case .warning:
            return .linkWarning
        case .clear:
            return .linkClear
        case .dark:
            return .linkDark
        case .black:
            return .linkBlack
        }
    }
}
