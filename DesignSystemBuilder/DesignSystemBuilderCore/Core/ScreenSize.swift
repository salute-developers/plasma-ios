import Foundation

enum ScreenSize: String {
    case small = "screen-s"
    case medium = "screen-m"
    case large = "screen-l"
}

extension ScreenSize {
    var camelCase: String {
        rawValue.components(separatedBy: "-").camelCase
    }
}
