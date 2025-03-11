import Foundation

extension BadgeStyle {
    var buttonStyle: ButtonStyle {
        switch self {
        case .basic:
            return .basic
        case .icon:
            return .icon
        }
    }
}
