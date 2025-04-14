import Foundation

enum Component: String {
    case embeddedChip = "embedded-chip"
    case chipGroup = "chip-group"
    case avatar = "avatar"
    case checkbox = "check-box"
    case radiobox = "radio-box"
    case `switch` = "switch"
    case iconButton = "icon-button"
    case indicator = "indicator"
    
    var componentName: String {
        switch self {
        case .embeddedChip:
            return "EmbeddedChip"
        case .chipGroup:
            return "ChipGroup"
        case .avatar:
            return "Avatar"
        case .checkbox:
            return "Checkbox"
        case .radiobox:
            return "Radiobox"
        case .switch:
            return "Switch"
        case .iconButton:
            return "IconButton"
        case .indicator:
            return "indicator"
        }
    }
}
