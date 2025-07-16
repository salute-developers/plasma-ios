import Foundation
import CoreGraphics

public enum StrokeCap: String, CaseIterable {
    case round
    case square
}

extension StrokeCap {
    var cgValue: CGLineCap {
        switch self {
        case .round:
            return .round
        case .square:
            return .square
        }
    }
}
