import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents
import SDDSIcons

extension SDDSButtonViewData {
    static func textOnly(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", size: size, appearance: .black, layoutMode: layoutMode)
    }
    
    static func textWithImage(size: ButtonSize, alignment: SDDSComponents.Alignment = .left, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: alignment), size: size, appearance: .black, layoutMode: layoutMode)
    }
    
    static func textWithSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", subtitle: "Value", size: size, appearance: .black, layoutMode: layoutMode)
    }
    
    static func textWithImageAndSubtitle(size: ButtonSize, alignment: SDDSComponents.Alignment = .left, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", subtitle: "Value", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: alignment), size: size, appearance: .black, layoutMode: layoutMode)
    }
    
    static func textOnlyLoading(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", size: size, isLoading: true, appearance: .black, layoutMode: layoutMode)
    }
    
    static func textOnlyLoadingTransparent(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", size: size, isLoading: true, spinnerStyle: .transparent, appearance: .transparent, layoutMode: layoutMode)
    }
    
    static func textOnlyDisabled(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", size: size, isDisabled: true, appearance: .black, layoutMode: layoutMode)
    }
    
    static func equilateral(size: ButtonSize, buttonStyle: SDDSComponents.ButtonStyle, isLoading: Bool = false) -> SDDSButtonViewData {
        .init(title: "", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: .left), size: size, isLoading: isLoading, buttonStyle: buttonStyle, appearance: .black)
    }
}

public extension ButtonAppearance {
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
    static var `default`: ButtonTypography {
        ButtonTypography(
            large: TypographyToken.semibold18,
            medium: TypographyToken.semibold16,
            small: TypographyToken.semibold14,
            xs: TypographyToken.semibold12,
            xxs: TypographyToken.semibold12
        )
    }
}

extension TypographyToken {
    static var semibold18: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 18,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold16: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 16,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold14: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 14,
            lineHeight: 22,
            kerning: 0
        )
    }
    
    static var semibold12: TypographyToken {
        .init(
            fontName: "SF Pro",
            weight: .semibold,
            style: .normal,
            size: 12,
            lineHeight: 22,
            kerning: 0
        )
    }
}

extension ColorToken {
    static var blackTitleColor: ColorToken {
        .init(
            darkColor: .white,
            lightColor: .black
        )
    }
    
    static var clearColor: ColorToken {
        .init(
            darkColor: .clear,
            lightColor: .clear
        )
    }
    
    static var titleColor: ColorToken {
        .init(
            darkColor: .black,
            lightColor: .white
        )
    }
    
    static var subtitleColor: ColorToken {
        .init(
            darkColor: Color(red: 23.0/255.0, green: 23.0/255.0, blue: 23.0/255.0, opacity: 0.26),
            lightColor: Color(red: 245.0/255.0, green: 245.0/255.0, blue: 245.0/255.0, opacity: 0.56)
        )
    }
    
    static var backgroundColor: ColorToken {
        .init(
            darkColor: Color(red: 249.0/255.0, green: 249.0/255.0, blue: 249.0/255.0, opacity: 1.0),
            lightColor: Color(red: 8.0/255.0, green: 8.0/255.0, blue: 8.0/255.0, opacity: 1.0)
        )
    }
}
