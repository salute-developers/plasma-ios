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
            return "4 поля"
        case .five:
            return "5 полей"
        case .six:
            return "6 полей (3+3)"
        }
    }
}
