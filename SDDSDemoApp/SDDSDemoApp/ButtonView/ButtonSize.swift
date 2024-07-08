import Foundation
import SDDSComponents
import SwiftUI

public enum ButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case xs
    case xxs
}

extension ButtonSize: ButtonSizeConfiguration {
    public var height: CGFloat {
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
    
    public var cornerRadius: CGFloat {
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
    
    public var paddings: EdgeInsets {
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
    
    public var iconSize: CGSize {
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
    
    public var spinnerSize: CGSize {
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
    
    public var debugDescription: String {
        return rawValue
    }
}
