import Foundation
import SwiftUI

enum SDDSComponentsType: String {
    case buttonColor = "ButtonColor"
    
    var defaultContext: String {
        switch self {
        case .buttonColor:
            return "\(self.rawValue)()"
        }
    }
}

extension Path {
    static var defaultContext: String {
        "Path()"
    }
}

extension CGFloat {
    static var defaultContext: String {
        "CGFloat(0)"
    }
    
    var context: String {
        "CGFloat(\(self))"
    }
}

extension EdgeInsets {
    static var defaultContext: String {
        "EdgeInsets()"
    }
}

extension CGSize {
    static var defaultContext: String {
        "CGSize.zero"
    }
}

extension CGPoint {
    static var defaultContext: String {
        "CGPoint.zero"
    }
}

extension FillStyle {
    static var defaultContext: String {
        "FillStyle()"
    }
}
