import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

public enum TextFieldSize: String, TextFieldSizeConfiguration {
    case large
    case medium
    case small
    case extraSmall

    public var titleBottomPadding: CGFloat {
        switch self {
        case .large:
            12
        case .medium:
            10
        case .small:
            8
        case .extraSmall:
            6
        }
    }

    public var titleInnerPadding: CGFloat {
        switch self {
        case .large:
            2
        case .medium:
            2
        case .small:
            2
        case .extraSmall:
            2
        }
    }
    
    public var textBeforeLeadingPadding: CGFloat {
        return 0
    }
    
    public var textBeforeTrailingPadding: CGFloat {
        return 2
    }
    
    public var textAfterLeadingPadding: CGFloat {
        return 0
    }
    
    public var textAfterTrailingPadding: CGFloat {
        return 2
    }
    
    public var boxLeadingPadding: CGFloat {
        switch self {
        case .large:
            16
        case .medium:
            8
        case .small:
            8
        case .extraSmall:
            8
        }
    }

    public var boxTrailingPadding: CGFloat {
        switch self {
        case .large:
            16
        case .medium:
            8
        case .small:
            8
        case .extraSmall:
            8
        }
    }

    public var captionTopPadding: CGFloat {
        4
    }
    
    public var optionalPadding: CGFloat {
        4
    }

    public var cornerRadius: CGFloat {
        switch self {
        case .large:
            14
        case .medium:
            12
        case .small:
            10
        case .extraSmall:
            8
        }
    }

    public var borderWidth: CGFloat {
        0
    }

    public var iconPadding: CGFloat {
        switch self {
        case .large:
            6
        case .medium:
            4
        case .small:
            2
        case .extraSmall:
            2
        }
    }

    public var iconActionPadding: CGFloat {
        switch self {
        case .large:
            10
        case .medium:
            8
        case .small:
            4
        case .extraSmall:
            4
        }
    }
    
    public func indicatorSize(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGSize {
        .zero
    }
    
    public func indicatorOffset(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement) -> CGPoint {
        .zero
    }

    public var fieldHeight: CGFloat {
        switch self {
        case .large:
            56
        case .medium:
            48
        case .small:
            40
        case .extraSmall:
            32
        }
    }

    public var iconSize: CGSize {
        switch self {
        case .large:
            CGSize(width: 24, height: 24)
        case .medium:
            CGSize(width: 24, height: 24)
        case .small:
            CGSize(width: 24, height: 24)
        case .extraSmall:
            CGSize(width: 16, height: 16)
        }
    }

    public var iconActionSize: CGSize {
        switch self {
        case .large:
            CGSize(width: 24, height: 24)
        case .medium:
            CGSize(width: 24, height: 24)
        case .small:
            CGSize(width: 24, height: 24)
        case .extraSmall:
            CGSize(width: 16, height: 16)
        }
    }
    
    public var chipsPadding: CGFloat {
        6
    }

    public var multipleValueHorizontalPadding: CGFloat {
        2
    }

    public var dividerHeight: CGFloat {
        1
    }
    
    public var chipContainerHorizontalPadding: CGFloat {
        4
    }

    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var chipGroupHeight: CGFloat {
        0
    }
    
    public var chipGroupVerticalTopPadding: CGFloat {
        0
    }
    
    public var chipGroupVerticalBottomPadding: CGFloat {
        0
    }
}
