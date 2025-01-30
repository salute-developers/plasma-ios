import Foundation
import SDDSComponents

public struct SDDSProgressViewSize: ProgressBarSizeConfiguration {
    public var debugDescription: String {
        "SDDSProgressViewSize"
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
