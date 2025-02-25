import Foundation

enum Component: String {
    case embeddedChip = "embedded-chip"
    case chipGroup = "chip-group"
    case checkBox = "check-box"
    case radioBox = "radio-box"
    case `switch` = "switch"
    case avatar = "avatar"
    case iconButton = "icon-button"
    
    var componentName: String {
        switch self {
        case .embeddedChip:
            return "EmbeddedChip"
        case .chipGroup:
            return "ChipGroup"
        case .avatar:
            return "Avatar"
        case .iconButton:
            return "IconButton"
        case .checkBox:
            return "Checkbox"
        case .radioBox:
            return "Radiobox"
        case .switch:
            return "Switch"
        }
    }
}
