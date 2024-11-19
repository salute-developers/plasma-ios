import Foundation
import SDDSThemeCore

extension String {
    var sizeKey: String {
        switch self {
        case "xxs":
            return "extraExtraSmall"
        case "xs":
            return "extraSmall"
        case "s":
            return "small"
        case "m":
            return "medium"
        case "l":
            return "large"
        default:
            return "unknownSize"
        }
    }
}
