import Foundation


public enum SDDSSwitchSize: SwitchSizeConfiguration {
    case large
    case medium
    case small
    
    public var debugDescription: String {
        String(reflecting: self)
    }

    public var width: CGFloat? {
        return 170
    }
    
    public var verticalGap: CGFloat {
        return 0
    }
}
