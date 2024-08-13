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
        .init(title: "Label", size: size, isLoading: true, spinnerStyle: .transparent, appearance: .linkDefault, layoutMode: layoutMode)
    }
    
    static func textOnlyDisabled(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButtonViewData {
        .init(title: "Label", size: size, isDisabled: true, appearance: .black, layoutMode: layoutMode)
    }
    
    static func equilateral(size: ButtonSize, buttonStyle: SDDSComponents.ButtonStyle, isLoading: Bool = false) -> SDDSButtonViewData {
        .init(title: "", iconAttributes: ButtonIconAttributes(image: Asset.accessibility24.image, alignment: .left), size: size, isLoading: isLoading, buttonStyle: buttonStyle, appearance: .black)
    }
}
