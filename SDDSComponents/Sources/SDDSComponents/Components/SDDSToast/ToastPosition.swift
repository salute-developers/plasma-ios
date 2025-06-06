import Foundation
import SwiftUI

public enum ToastPosition: String, CaseIterable {
    case topStart = "Top Start"
    case topCenter = "Top Center"
    case topEnd = "Top End"
    case centerStart = "Center Start"
    case center = "Center"
    case centerEnd = "Center End"
    case bottomStart = "Bottom Start"
    case bottomCenter = "Bottom Center"
    case bottomEnd = "Bottom End"
    
    var horizontalAlignment: HorizontalAlignment {
        switch self {
        case .topStart, .centerStart, .bottomStart:
            return .leading
        case .topCenter, .center, .bottomCenter:
            return .center
        case .topEnd, .centerEnd, .bottomEnd:
            return .trailing
        }
    }
    
    var verticalAlignment: VerticalAlignment {
        switch self {
        case .topStart, .topCenter, .topEnd:
            return .top
        case .centerStart, .center, .centerEnd:
            return .center
        case .bottomStart, .bottomCenter, .bottomEnd:
            return .bottom
        }
    }
    
    var stackDirection: StackDirection {
        switch self {
        case .topStart, .topCenter, .topEnd:
            return .down
        case .centerStart, .center, .centerEnd:
            return .up
        case .bottomStart, .bottomCenter, .bottomEnd:
            return .up
        }
    }
}

enum StackDirection {
    case up
    case down
}