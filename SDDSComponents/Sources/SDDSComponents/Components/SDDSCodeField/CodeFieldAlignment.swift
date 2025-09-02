import Foundation
import SwiftUI

public enum CodeFieldAlignment: String, CaseIterable {
    case leading
    case center
}

extension CodeFieldAlignment {
    var suiAlignment: Alignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        }
    }
    
    var textAlignment: TextAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        }
    }
}
