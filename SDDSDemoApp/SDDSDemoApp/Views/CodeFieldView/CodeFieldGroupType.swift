import Foundation
import SDDSComponents

enum CodeFieldGroupType: String, CaseIterable {
    case four = "Four"
    case five = "Five"
    case six = "Six"
    
    var groups: [CodeFieldGroup] {
        switch self {
        case .four:
            return CodeFieldGroup.four
        case .five:
            return CodeFieldGroup.five
        case .six:
            return CodeFieldGroup.six
        }
    }
    
    var displayName: String {
        switch self {
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        }
    }
}
