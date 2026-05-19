import Foundation
import SwiftUI

public enum FormTitlePlacement: String, CaseIterable, Codable {
    case start
    case top
    case none
}

public enum FormTextAlignment: String, CaseIterable, Codable {
    case center
    case edge
}

public enum FormType: String, CaseIterable, Codable {
    case optional
    case required
}

public enum FormIndicatorAlignmentMode: String, CaseIterable, Codable {
    case inner
    case outer
}

public enum FormIndicatorAlignment: String, CaseIterable, Codable {
    case topStart
    case topCenter
    case topEnd
    case centerStart
    case center
    case centerEnd
    case bottomStart
    case bottomCenter
    case bottomEnd

    var alignment: Alignment {
        switch self {
        case .topStart:
            return .topLeading
        case .topCenter:
            return .top
        case .topEnd:
            return .topTrailing
        case .centerStart:
            return .leading
        case .center:
            return .center
        case .centerEnd:
            return .trailing
        case .bottomStart:
            return .bottomLeading
        case .bottomCenter:
            return .bottom
        case .bottomEnd:
            return .bottomTrailing
        }
    }
}
