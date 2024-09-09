import Foundation
import SDDSComponents
import SwiftUI

enum LinkSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

extension LinkSize {
    var buttonSize: ButtonSize {
        return ButtonSize(rawValue: self.rawValue) ?? .medium
    }
}

extension LinkSize: ButtonSizeConfiguration {
    var height: CGFloat {
        buttonSize.height
    }
    
    var cornerRadius: CGFloat {
        0
    }
    
    var paddings: EdgeInsets {
        buttonSize.paddings.zeroLateral
    }
    
    var iconSize: CGSize {
        buttonSize.iconSize
    }
    
    var spinnerSize: CGSize {
        buttonSize.spinnerSize
    }
    
    var iconHorizontalGap: CGFloat {
        buttonSize.iconHorizontalGap
    }
    
    var titleHorizontalGap: CGFloat {
        buttonSize.titleHorizontalGap
    }
    
    var debugDescription: String {
        "LinkSize"
    }
}
