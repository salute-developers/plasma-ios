import Foundation
import SDDSIcons
import SwiftUI
import SDDSThemeCore

extension SDDSButtonViewModel {
    static func textOnly(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", size: size, style: .black, layoutMode: layoutMode)
    }
    
    static func textWithImage(size: ButtonSize, alignment: Alignment = .left, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: alignment), size: size, style: .black, layoutMode: layoutMode)
    }
    
    static func textWithSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", subtitle: "Value", size: size, style: .black, layoutMode: layoutMode)
    }
    
    static func textWithImageAndSubtitle(size: ButtonSize, alignment: Alignment = .left, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", subtitle: "Value", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: alignment), size: size, style: .black, layoutMode: layoutMode)
    }
    
    static func textOnlyLoading(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", size: size, isLoading: true, style: .black, layoutMode: layoutMode)
    }
    
    static func textOnlyLoadingTransparent(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", size: size, isLoading: true, spinnerStyle: .transparent, style: .transparent, layoutMode: layoutMode)
    }
    
    static func textOnlyDisabled(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewModel {
        .init(title: "Label", size: size, isDisabled: true, style: .black, layoutMode: layoutMode)
    }
    
    static func equilateral(size: ButtonSize, layoutMode: ButtonLayoutMode, isLoading: Bool = false) -> SDDSButtonViewModel {
        .init(title: "", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: .left), size: size, isLoading: isLoading, style: .black, layoutMode: layoutMode)
    }
}

public extension ButtonStyle {
    static var black: ButtonStyle {
        ButtonStyle(
            titleTypography: TypographyToken.semibold18,
            titleColor: ColorToken.titleColor,
            subtitleTypography: TypographyToken.semibold18,
            subtitleColor: ColorToken.subtitleColor, 
            iconColor: ColorToken.titleColor, 
            spinnerColor: ColorToken.titleColor,
            backgroundColor: ColorToken.backgroundColor
        )
    }
    
    static var transparent: ButtonStyle {
        ButtonStyle(
            titleTypography: TypographyToken.semibold18,
            titleColor: ColorToken.blackTitleColor,
            subtitleTypography: TypographyToken.semibold18,
            subtitleColor: ColorToken.blackTitleColor,
            iconColor: ColorToken.blackTitleColor,
            spinnerColor: ColorToken.blackTitleColor,
            backgroundColor: ColorToken.clearColor
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
