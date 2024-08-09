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
            backgroundColor: ColorToken.backgroundColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.0
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
            backgroundColor: ColorToken.clearColor,
            disabledAlpha: 0.4,
            loadingAlpha: 0.06
        )
    }
}

extension ButtonTypography {
    static var `default`: TypographyConfiguration {
        ButtonTypography(
            large: TypographyToken.semibold18,
            medium: TypographyToken.semibold16,
            small: TypographyToken.semibold14,
            extraSmall: TypographyToken.semibold12,
            extraExtraSmall: TypographyToken.semibold12
        )
        .asContainer
    }
}

enum ButtonSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

enum LinkSize: String, CaseIterable {
    case large
    case medium
    case small
    case extraSmall
    case extraExtraSmall
}

struct ButtonTypography: GeneralTypographyConfiguration {
    typealias S = ButtonSizeConfiguration
    
    let large: TypographyToken?
    let medium: TypographyToken?
    let small: TypographyToken?
    let extraSmall: TypographyToken?
    let extraExtraSmall: TypographyToken?
    
    init(large: TypographyToken?, medium: TypographyToken?, small: TypographyToken?, extraSmall: TypographyToken?, extraExtraSmall: TypographyToken?) {
        self.large = large
        self.medium = medium
        self.small = small
        self.extraSmall = extraSmall
        self.extraExtraSmall = extraExtraSmall
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
        case .extraSmall:
            return extraSmall
        case .extraExtraSmall:
            return extraExtraSmall
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
