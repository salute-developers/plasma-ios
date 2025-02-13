import Foundation

enum Component: String {
    case embeddedChip = "embedded-chip"
    case chipGroup = "chip-group"
    case avatar = "avatar"
    case iconButton = "icon-button"
    case checkBox = "check-box"
    case radioBox = "radio-box"
    case `switch` = "switch"
    
    var componentName: String {
        switch self {
        case .embeddedChip:
            return "EmbeddedChip"
        case .chipGroup:
            return "SDDSChipGroup"
        case .avatar:
            return "SDDSAvatar"
        case .iconButton:
            return "IconButton"
        case .checkBox:
            return "SDDSCheckbox"
        case .radioBox:
            return "SDDSRadiobox"
        case .switch:
            return "SDDSSwitch"
        }
    }
}




