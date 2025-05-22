import Foundation

enum Component: String {
    case embeddedChip = "embedded-chip"
    case chipGroup = "chip-group"
    case avatar = "avatar"
    case checkbox = "check-box"
    case radiobox = "radio-box"
    case `switch` = "switch"
    case iconButton = "icon-button"
    case counter = "counter"
    case segmentItem = "segment-item"
    case badge = "badge-solid"
    case badgeClear = "badge-clear"
    case badgeTransparent = "badge-transparent"
    case iconBadge = "icon-badge"
    case iconBadgeTransparent = "icon-badge-transparent"
    case indicator = "indicator"
    case circularProgressBar = "circular-progress-bar"
    
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
        case .counter:
            return "Counter"
        case .segmentItem:
            return "SegmentItem"
        case .badge:
            return "Badge"
        case .badgeClear:
            return "BadgeClear"
        case .badgeTransparent:
            return "BadgeTransparent"
        case .iconBadge:
            return "IconBadge"
        case .iconBadgeTransparent:
            return "IconBadgeTransparent"
        case .indicator:
            return "Indicator"
        case .circularProgressBar:
            return "CircularProgressBar"
        }
    }
}
