import Foundation
import SwiftUI

// MARK: - Extension to Generate Example Buttons
extension SDDSButton {
    static func defaultTextWithSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Label",
            subtitle: "Value",
            size: size,
            appearance: .black,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func textWithLeftIconAndSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: ButtonIconAttributes(image: Image(systemName: "pencil.circle.fill"), alignment: .left),
            size: size,
            appearance: .black,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func textWithRightIcon(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: ButtonIconAttributes(image: Image(systemName: "pencil.circle.fill"), alignment: .right),
            size: size,
            appearance: .black,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func loadingButton(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Loading",
            subtitle: "Value",
            size: size,
            isLoading: true,
            appearance: .black,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func transparentLoadingButton(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton(
            title: "Loading",
            subtitle: "Value",
            size: size,
            isLoading: true,
            spinnerStyle: .transparent,
            appearance: .transparent,
            layoutMode: layoutMode,
            action: {}
        )
    }
}

extension ButtonAppearance {
    static var black: ButtonAppearance {
        .init(
            titleTypography: ButtonTypography.default,
            titleColor: ColorToken.titleColor,
            subtitleTypography: ButtonTypography.default,
            subtitleColor: ColorToken.subtitleColor,
            iconColor: ColorToken.titleColor,
            spinnerColor: ColorToken.titleColor,
            backgroundColor: ColorToken.backgroundColor
        )
    }
    
    static var transparent: ButtonAppearance {
        .init(
            titleTypography: ButtonTypography.default,
            titleColor: ColorToken.blackTitleColor,
            subtitleTypography: ButtonTypography.default,
            subtitleColor: ColorToken.blackTitleColor,
            iconColor: ColorToken.blackTitleColor,
            spinnerColor: ColorToken.blackTitleColor,
            backgroundColor: ColorToken.clearColor
        )
    }
}

extension ButtonTypography {
    static var `default`: TypographyConfiguration {
        ButtonTypography(
            large: TypographyToken.semibold18,
            medium: TypographyToken.semibold16,
            small: TypographyToken.semibold14,
            xs: TypographyToken.semibold12,
            xxs: TypographyToken.semibold12
        )
        .asContainer
    }
}

enum ButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case xs
    case xxs
}

struct ButtonTypography: GeneralTypographyConfiguration {
    typealias S = ButtonSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let xs: TypographyToken?
    let xxs: TypographyToken?
    
    init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, xs: TypographyToken?, xxs: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.xs = xs
        self.xxs = xxs
    }
    
    /**
     Возвращает типографику для заданного размера кнопки.
     
     - Parameter size: Размер кнопки.
     - Returns: Типографика для заданного размера кнопки или nil, если не задана.
     */
    func typography(with size: ButtonSizeConfiguration) -> TypographyToken? {
        switch size as? ButtonSize {
        case .large:
            return large
        case .medium:
            return medium
        case .small:
            return small
        case .xs:
            return xs
        case .xxs:
            return xxs
        case .none:
            return medium
        }
    }
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
    
    var titleHorizontalGap: CGFloat {
        switch self {
        case .xs, .xxs:
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
        case .xs, .xxs:
            return Spacing.Button.Gap.extraSmall
        }
    }
    
    var debugDescription: String {
        return rawValue
    }
    
}
