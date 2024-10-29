import Foundation

import SwiftUI

public enum LinkSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

public extension LinkSize {
    var buttonSize: ButtonSize {
        return ButtonSize(rawValue: self.rawValue) ?? .medium
    }
}

extension LinkSize: ButtonSizeConfiguration {
    public var height: CGFloat {
        buttonSize.height
    }
    
    public var cornerRadius: CGFloat {
        0
    }
    
    public var paddings: EdgeInsets {
        buttonSize.paddings.zeroLateral
    }
    
    public var iconSize: CGSize {
        buttonSize.iconSize
    }
    
    public var spinnerSize: CGSize {
        buttonSize.spinnerSize
    }
    
    public var iconHorizontalGap: CGFloat {
        buttonSize.iconHorizontalGap
    }
    
    public var titleHorizontalGap: CGFloat {
        buttonSize.titleHorizontalGap
    }
    
    public var debugDescription: String {
        "LinkSize"
    }
}
