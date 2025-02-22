import Foundation

enum Component: String {
    case embeddedChip = "embedded-chip"
    case chipGroup = "chip-group"
    case avatar = "avatar"
    case iconButton = "icon-button"
    case checkBox = "check-box"
    case radioBox = "radio-box"
    case `switch` = "switch"
    case cell = "cell"
    
    var componentName: String {
        switch self {
        case .embeddedChip:
            return "EmbeddedChip"
        case .chipGroup:
            return "ChipGroup"
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
        case .cell:
            return "Cell"
        }
    }
}
