import Foundation
import SwiftUI

public enum ButtonSize {
    case xxs
    case xs
    case small
    case medium
    case large
}

extension ButtonSize {
    var height: CGFloat {
        switch self {
        case .large:
            return Spacing.Button.Height.large
        case .medium:
            return Spacing.Button.Height.medium
        case .small:
            return Spacing.Button.Height.small
        case .xs:
            return Spacing.Button.Height.xs
        case .xxs:
            return Spacing.Button.Height.xxs
        }
    }
    
    var cornerRadius: CGFloat {
        switch self {
        case .large:
            return Spacing.Button.CornerRadius.large
        case .medium:
            return Spacing.Button.CornerRadius.medium
        case .small:
            return Spacing.Button.CornerRadius.small
        case .xs:
            return Spacing.Button.CornerRadius.xs
        case .xxs:
            return Spacing.Button.CornerRadius.xxs
        }
    }
    
    var paddings: EdgeInsets {
        switch self {
        case .large:
            return Spacing.Button.Padding.large
        case .medium:
            return Spacing.Button.Padding.medium
        case .small:
            return Spacing.Button.Padding.small
        case .xs:
            return Spacing.Button.Padding.xs
        case .xxs:
            return Spacing.Button.Padding.xxs
        }
    }
    
    var iconSize: CGSize {
        switch self {
        case .large:
            return Spacing.Button.IconSize.large
        case .medium:
            return Spacing.Button.IconSize.medium
        case .small:
            return Spacing.Button.IconSize.small
        case .xs:
            return Spacing.Button.IconSize.xs
        case .xxs:
            return Spacing.Button.IconSize.xxs
        }
    }
    
    var spinnerSize: CGSize {
        switch self {
        case .large:
            return Spacing.Button.SpinnerSize.large
        case .medium:
            return Spacing.Button.SpinnerSize.medium
        case .small:
            return Spacing.Button.SpinnerSize.small
        case .xs:
            return Spacing.Button.SpinnerSize.xs
        case .xxs:
            return Spacing.Button.SpinnerSize.xxs
        }
    }
}
