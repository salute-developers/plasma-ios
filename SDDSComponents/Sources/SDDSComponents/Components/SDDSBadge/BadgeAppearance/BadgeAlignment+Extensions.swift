import Foundation

extension BadgeAlignment {
    var buttonAlignment: ButtonAlignment {
        switch self {
        case .leading:
            return .leading
        case .trailing:
            return .trailing
        }
    }
}
