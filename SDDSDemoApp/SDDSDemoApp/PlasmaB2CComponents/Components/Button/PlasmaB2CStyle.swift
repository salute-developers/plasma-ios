import Foundation
import SDDSComponents

public enum PlasmaB2CStyle: String {
    case `default`
    case secondary
    case accent
    case positive
    case negative
    case warning
    case clear
    case dark
    case black
}

extension PlasmaB2CStyle {
    var defaultAppearance: ButtonAppearance {
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
    
    var linkAppearance: ButtonAppearance {
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
