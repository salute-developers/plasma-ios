import Foundation
import SwiftUI

/// Определяет конфигурацию размеров текстового поля.
public protocol TextAreaSizeConfiguration: CustomDebugStringConvertible {
    var titleBottomPadding: CGFloat { get }
    var titleInnerPadding: CGFloat { get }
    var fieldHorizontalPadding: CGFloat { get }
    var captionTopPadding: CGFloat { get }
    var textInputPaddings: EdgeInsets { get }
    var cornerRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconPadding: CGFloat { get }
    var iconActionPadding: CGFloat { get }
    var indicatorSize: CGSize { get }
    var fieldHeight: CGFloat { get }
    var iconSize: CGSize { get }
    var iconActionSize: CGSize { get }
    var multipleValueHorizontalPadding: CGFloat { get }
    var chipContainerHorizontalPadding: CGFloat { get }
    var lineWidth: CGFloat { get }
    var textBeforeLeadingPadding: CGFloat { get }
    var textBeforeTrailingPadding: CGFloat { get }
    var textAfterLeadingPadding: CGFloat { get }
    var textAfterTrailingPadding: CGFloat { get }
    var textHorizontalPadding: CGFloat { get }
    var chipGroupHeight: CGFloat { get }
    var chipGroupVerticalBottomPadding: CGFloat { get }
    var textInputMultipleBottomPadding: CGFloat { get }
    
    func indicatorPadding(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGFloat
    func indicatorYOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGFloat
}

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
    
    public func indicatorYOffset(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGFloat {
        switch (self, labelPlacement, requiredPlacement) {
        case (.large, .outer, .left):
            return 8
        case (.medium, .outer, .left):
            return 7
        case (.small, .outer, .left):
            return 6
        case (.extraSmall, .outer, .left):
            return 4
        case (.large, .inner, .right):
            return 24
        case (.medium, .inner, .right):
            return 23
        case (.small, .inner, .right):
            return 22
        case (.extraSmall, .inner, .right):
            return 21
        case (.large, .none, .left):
            return 24
        case (.medium, .none, .left):
            return 23
        case (.small, .none, .left):
            return 22
        case (.extraSmall, .none, .left):
            return 21
        case (.large, .outer, .right), (.medium, .outer, .right), (.small, .outer, .right):
            return -2
        case (.extraSmall, .outer, .right):
            return 0
        case (.large, .none, .right), (.medium, .none, .right), (.small, .none, .right):
            return -4
        case (.extraSmall, .none, .right):
            return -2
        default:
            return 0
        }
    }


    public func indicatorPadding(labelPlacement: TextAreaLabelPlacement, requiredPlacement: TextAreaRequiredPlacement) -> CGFloat {
        switch (self, labelPlacement, requiredPlacement) {
        case (.large, .outer, .left), (.medium, .outer, .left):
            return 6
        case (.small, .outer, .left), (.extraSmall, .outer, .left):
            return 4
        case (.large, .outer, .right), (.medium, .outer, .right), (.small, .outer, .right), (.extraSmall, .outer, .right):
            return 4
        case (.large, .inner, .left), (.medium, .inner, .left):
            return 6
        case (.small, .inner, .left), (.extraSmall, .inner, .left):
            return 4
        case (.large, .inner, .right), (.medium, .inner, .right), (.small, .inner, .right), (.extraSmall, .inner, .right):
            return 4
        case (.large, .none, .right), (.medium, .none, .right):
            return 6
        case (.small, .none, .right), (.extraSmall, .none, .right):
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
    
    public var chipGroupHeight: CGFloat {
        return 82
    }
    
    public var chipGroupVerticalBottomPadding: CGFloat {
        return 4
    }
    
    public var textInputMultipleBottomPadding: CGFloat {
        return 4
    }

    public var debugDescription: String {
        rawValue
    }
}

public enum TextAreaChipSize: String, ChipSizeConfiguration {
    case large
    case medium
    case small
    case extraSmall
    
    public var debugDescription: String {
        rawValue
    }
    
    public var iconImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 20, height: 20)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var buttonImageSize: CGSize? {
        switch self {
        case .large:
            return CGSize(width: 24, height: 24)
        case .medium:
            return CGSize(width: 20, height: 20)
        case .small:
            return CGSize(width: 16, height: 16)
        case .extraSmall:
            return CGSize(width: 12, height: 12)
        }
    }
    
    public var leadingInset: CGFloat {
        switch self {
        case .large:
            return 16
        case .medium:
            return 14
        case .small:
            return 12
        case .extraSmall:
            return 10
        }
    }
    
    public var trailingInset: CGFloat {
        switch self {
        case .large:
            return 8
        case .medium:
            return 6
        case .small:
            return 4
        case .extraSmall:
            return 2
        }
    }
    
    public var spacing: CGFloat {
        switch self {
        case .large:
            return 6
        case .medium:
            return 4
        case .small:
            return 2
        case .extraSmall:
            return 2
        }
    }
    
    public var height: CGFloat {
        switch self {
        case .large:
            return 44
        case .medium:
            return 40
        case .small:
            return 32
        case .extraSmall:
            return 24
        }
    }
    
    public var borderStyle: ChipBorderStyle {
        switch self {
        case .large:
            return .default(8)
        case .medium:
            return .default(6)
        case .small:
            return .default(4)
        case .extraSmall:
            return .default(2)
        }
    }

}

#Preview {
    SDDSTextAreaPreview.previews
}
