import Foundation
import SwiftUI
import SDDSComponents
import Foundation
import SDDSComponents
import SwiftUI
import SDDSServTheme

public enum SDDSTextFieldSize: String, TextFieldSizeConfiguration {
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

    public var fieldHorizontalPadding: CGFloat {
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

    public var textInputPaddings: EdgeInsets {
        .init(top: 2, leading: 0, bottom: 0, trailing: 0)
    }
    
    public var textHorizontalPadding: CGFloat {
        return 1.0
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

    public var indicatorSize: CGSize {
        switch self {
        case .large:
            CGSize(width: 8, height: 8)
        case .medium:
            CGSize(width: 8, height: 8)
        case .small:
            CGSize(width: 6, height: 6)
        case .extraSmall:
            CGSize(width: 6, height: 6)
        }
    }
    
    public func indicatorYOffset(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement, layout: TextFieldLayout) -> CGFloat {
        switch (self, labelPlacement, requiredPlacement, layout) {
        case (.large, .outer, .left, _):
            return 8
        case (.medium, .outer, .left, _):
            return 7
        case (.small, .outer, .left, _):
            return 6
        case (.extraSmall, .outer, .left, _):
            return 4
        case (.large, .inner, .right, .clear):
            return 24
        case (.medium, .inner, .right, .clear):
            return 23
        case (.small, .inner, .right, .clear):
            return 22
        case (.extraSmall, .inner, .right, .clear):
            return 21
        case (.large, .none, .left, .clear):
            return 24
        case (.medium, .none, .left, .clear):
            return 23
        case (.small, .none, .left, .clear):
            return 22
        case (.extraSmall, .none, .left, .clear):
            return 21
        case (.large, .outer, .right, _), (.medium, .outer, .right, _), (.small, .outer, .right, _):
            return -2
        case (.extraSmall, .outer, .right, _):
            return 0
        case (.large, .none, .right, .clear), (.medium, .none, .right, .clear), (.small, .none, .right, .clear):
            return -4
        case (.extraSmall, .none, .right, .clear):
            return -2
        default:
            break
        }
        
        return 0
    }

    public func indicatorPadding(labelPlacement: TextFieldLabelPlacement, requiredPlacement: TextFieldRequiredPlacement, layout: TextFieldLayout) -> CGFloat {
        switch (self, labelPlacement, requiredPlacement, layout) {
        case (.large, .outer, .left, _), (.medium, .outer, .left, _):
            return 6
        case (.small, .outer, .left, _), (.extraSmall, .outer, .left, _):
            return 4
        case (.large, .outer, .right, _), (.medium, .outer, .right, .default), (.small, .outer, .right, _), (.extraSmall, .outer, .right, _):
            return 4
        case (.large, .inner, .left, .clear), (.medium, .inner, .left, .clear):
            return 6
        case (.small, .inner, .left, .clear), (.extraSmall, .inner, .left, .clear):
            return 4
        case (.large, .inner, .right, .clear), (.medium, .inner, .right, .clear), (.small, .inner, .right, .clear), (.extraSmall, .inner, .right, .clear):
            return 4
        case (.large, .none, .right, .clear), (.medium, .none, .right, .clear):
            return 6
        case (.small, .none, .right, .clear), (.extraSmall, .none, .right, .clear):
            return 4
        default:
            return 6
        }
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

    public var multipleValueHorizontalPadding: CGFloat {
        2
    }

    public var lineWidth: CGFloat {
        1
    }
    
    public var chipContainerHorizontalPadding: CGFloat {
        4
    }

    public var debugDescription: String {
        String(reflecting: self)
    }
}
