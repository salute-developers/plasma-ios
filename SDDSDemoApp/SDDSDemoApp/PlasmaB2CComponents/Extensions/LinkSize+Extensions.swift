import Foundation

extension LinkSize {
    var buttonSize: ButtonSize {
        return ButtonSize(rawValue: self.rawValue) ?? .medium
    }
}
