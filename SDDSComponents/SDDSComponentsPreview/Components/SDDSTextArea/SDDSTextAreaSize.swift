import Foundation
import SwiftUI
import SDDSComponents

public enum SDDSTextAreaSize: String, TextAreaSizeConfiguration {
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
            4
        case .medium:
            4
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
    
    public var iconActionClearTrailingPadding: CGFloat {
        switch self {
        case .large:
            6
        case .medium:
            5
        case .small:
            4
        case .extraSmall:
            3
        }
    }

    public var captionTopPadding: CGFloat {
        4
    }
    
    public var captionBottomPadding: CGFloat {
        4
    }

    public var textInputPaddings: EdgeInsets {
        switch self {
        case .large:
            .init(top: 16, leading: 0, bottom: 8, trailing: 0)
        case .medium:
            .init(top: 14, leading: 0, bottom: 6, trailing: 0)
        case .small:
            .init(top: 12, leading: 0, bottom: 4, trailing: 0)
        case .extraSmall:
            .init(top: 8, leading: 0, bottom: 4, trailing: 0)
        }
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
    
    public func indicatorYOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat {
        switch (self, labelPlacement, requiredPlacement, layout) {
        case (.large, .outer, .left, _):
            return 7
        case (.medium, .outer, .left, _):
            return 6
        case (.small, .outer, .left, _):
            return 5
        case (.extraSmall, .outer, .left, _):
            return 4
        case (.large, .inner, .right, .clear), (.large, .inner, .left, .clear):
            return 25
        case (.medium, .inner, .right, .clear), (.medium, .inner, .left, .clear):
            return 22
        case (.small, .inner, .right, .clear), (.small, .inner, .left, .clear):
            return 19
        case (.extraSmall, .inner, .right, .clear), (.extraSmall, .inner, .left, .clear):
            return 12
        case (.large, .none, .left, .clear), (.large, .none, .right, .clear):
            return 20
        case (.medium, .none, .left, .clear), (.medium, .none, .right, .clear):
            return 19
        case (.small, .none, .left, .clear), (.small, .none, .right, .clear):
            return 18
        case (.extraSmall, .none, .left, .clear), (.extraSmall, .none, .right, .clear):
            return 17
        case (.large, .outer, .right, _), (.medium, .outer, .right, _), (.small, .outer, .right, _):
            return -2
        case (.extraSmall, .outer, .right, _):
            return 0
        default:
            break
        }
        
        return 0
    }

    public func indicatorPadding(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement, layout: TextAreaLayout) -> CGFloat {
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
    public func fieldHeight(layout: TextAreaLayout) -> CGFloat {
        switch layout {
        case .default:
            switch self {
            case .large:
                130
            case .medium:
                134
            case .small:
                140
            case .extraSmall:
                140
            }
        case .clear:
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
    
    public var chipGroupHeight: CGFloat {
        return 82
    }
    
    public var chipGroupVerticalBottomPadding: CGFloat {
        return 8
    }
    
    public var chipGroupVerticalTopPadding: CGFloat {
        return 8
    }
    
    public var textInputBottomPadding: CGFloat {
        return 0
    }

    public var debugDescription: String {
        rawValue
    }
}

extension SDDSTextAreaSize {
    public var chipGroupSize: SDDSTextAreaChipGroupSize {
        switch self {
        case .large:
            return .large(.left)
        case .medium:
            return .medium(.left)
        case .small:
            return .small(.left)
        case .extraSmall:
            return .extraSmall(.left)
        }
    }
}

extension SDDSTextAreaSize: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
