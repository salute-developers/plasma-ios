import Foundation
import SDDSComponents

public enum SDDSSwitchSize: SwitchSizeConfiguration {
    case large
    case medium
    case small
    
    public var debugDescription: String {
        return "SDDSSwitchSize"
    }

    public var width: CGFloat? {
        return 170
    }
    
    public var verticalGap: CGFloat {
        return 4
    }
}
