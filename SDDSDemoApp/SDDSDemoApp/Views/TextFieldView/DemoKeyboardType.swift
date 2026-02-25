import UIKit

enum DemoKeyboardType: String, CaseIterable, Identifiable {
    case `default` = "Default"
    case numberPad = "Number Pad"
    case decimalPad = "Decimal Pad"
    case emailAddress = "Email Address"
    case phonePad = "Phone Pad"
    case url = "URL"
    case asciiCapable = "ASCII Capable"

    var id: Self { self }

    var uiKeyboardType: UIKeyboardType {
        switch self {
        case .default:
            return .default
        case .numberPad:
            return .numberPad
        case .decimalPad:
            return .decimalPad
        case .emailAddress:
            return .emailAddress
        case .phonePad:
            return .phonePad
        case .url:
            return .URL
        case .asciiCapable:
            return .asciiCapable
        }
    }

    static func from(_ type: UIKeyboardType) -> DemoKeyboardType {
        switch type {
        case .numberPad:
            return .numberPad
        case .decimalPad:
            return .decimalPad
        case .emailAddress:
            return .emailAddress
        case .phonePad:
            return .phonePad
        case .URL:
            return .url
        case .asciiCapable:
            return .asciiCapable
        default:
            return .default
        }
    }
}
