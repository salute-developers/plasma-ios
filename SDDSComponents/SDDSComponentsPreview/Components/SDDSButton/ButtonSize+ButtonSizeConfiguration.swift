import Foundation
import SDDSComponents
import SwiftUI

enum ButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

extension ButtonSize: ButtonSizeConfiguration {
    var height: CGFloat {
        switch self {
        case .large:
            return Spacing.Button.Height.large
        case .medium:
            return Spacing.Button.Height.medium
        case .small:
            return Spacing.Button.Height.small
        case .extraSmall:
            return Spacing.Button.Height.extraSmall
        case .extraExtraSmall:
            return Spacing.Button.Height.extraExtraSmall
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
        case .extraSmall:
            return Spacing.Button.CornerRadius.extraSmall
        case .extraExtraSmall:
            return Spacing.Button.CornerRadius.extraExtraSmall
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
        case .extraSmall:
            return Spacing.Button.Padding.extraSmall
        case .extraExtraSmall:
            return Spacing.Button.Padding.extraExtraSmall
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
        case .extraSmall:
            return Spacing.Button.IconSize.extraSmall
        case .extraExtraSmall:
            return Spacing.Button.IconSize.extraExtraSmall
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
        case .extraSmall:
            return Spacing.Button.SpinnerSize.extraSmall
        case .extraExtraSmall:
            return Spacing.Button.SpinnerSize.extraExtraSmall
        }
    }
    
    var titleHorizontalGap: CGFloat {
        switch self {
        case .extraSmall, .extraExtraSmall:
            return Spacing.Button.Gap.small
        default:
            return Spacing.Button.Gap.medium
        }
    }
        
    var iconHorizontalGap: CGFloat {
        switch self {
        case .large:
            return Spacing.Button.Gap.large
        case .medium:
            return Spacing.Button.Gap.medium
        case .small:
            return Spacing.Button.Gap.small
        case .extraSmall, .extraExtraSmall:
            return Spacing.Button.Gap.extraSmall
        }
    }
    
    var debugDescription: String {
        return "ButtonSize"
    }
}
