import Foundation
import SDDSComponents

// Size configuration
public struct DefaultProgressBarSize: ProgressBarSizeConfiguration {
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var height: CGFloat {
        4.0
    }
    
    public var indicatorHeight: CGFloat {
        6.0
    }
    
    public var cornerRadius: CGFloat {
        2.0
    }
    
    public var indicatorCornerRadius: CGFloat {
        6.0
    }
    
    public init() {}
}
