import Foundation
import SDDSComponents
import SwiftUI

public enum CounterSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

extension CounterSize: CounterSizeConfiguration {
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 28
        case .medium:
            return 24
        case .small:
            return 20
        case .extraSmall:
            return 16
        case .extraExtraSmall:
            return 12
        }
    }
    
    public var width: CGFloat {
        switch self {
        case .large:
            return 28
        case .medium:
            return 24
        case .small:
            return 20
        case .extraSmall:
            return 16
        case .extraExtraSmall:
            return 12
        }
    }
    
    public var paddings: EdgeInsets {
        switch self {
        case .large:
            return EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
        case .medium:
            return EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8)
        case .small:
            return EdgeInsets(top: 4, leading: 6, bottom: 4, trailing: 6)
        case .extraSmall:
            return EdgeInsets(top: 1.5, leading: 4, bottom: 2.5, trailing: 4)
        case .extraExtraSmall:
            return EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2)
        }
    }
    
    public var debugDescription: String {
        "CounterSize"
    }
}
