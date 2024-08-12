import Foundation
import SDDSComponents

enum SDDSSwitchSize: SwitchSizeConfiguration {
    case large
    case medium
    case small
    
    var debugDescription: String {
        String(reflecting: self)
    }

    var width: CGFloat? {
        return 170
    }
    
    var verticalGap: CGFloat {
        return 0
    }
}
