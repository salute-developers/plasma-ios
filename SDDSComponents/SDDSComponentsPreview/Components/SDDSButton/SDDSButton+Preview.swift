import Foundation
import SDDSComponents
import SwiftUI

// MARK: - Extension to Generate Example Buttons
extension SDDSButton {
    static func defaultTextWithSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.basicButton(
            title: "Label",
            subtitle: "Value",
            size: .medium,
            style: .black,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func textWithLeftIconAndSubtitle(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.basicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: ButtonIconAttributes(image: Image(systemName: "pencil.circle.fill"), alignment: .left),
            size: .medium,
            style: .black,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func textWithRightIcon(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.basicButton(
            title: "Label",
            subtitle: "Value",
            iconAttributes: ButtonIconAttributes(image: Image(systemName: "pencil.circle.fill"), alignment: .right),
            size: .medium,
            style: .black,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func loadingButton(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.basicButton(
            title: "Label",
            subtitle: "Value",
            size: .medium,
            style: .black,
            isDisabled: false,
            isLoading: true,
            spinnerStyle: .solid,
            layoutMode: layoutMode,
            action: {}
        )
    }
    
    static func transparentLoadingButton(size: ButtonSize, layoutMode: ButtonLayoutMode = .wrapContent) -> SDDSButton {
        SDDSButton.basicButton(
            title: "Label",
            subtitle: "Value",
            size: .medium,
            style: .black,
            isDisabled: false,
            isLoading: true,
            spinnerStyle: .transparent,
            layoutMode: layoutMode,
            action: {}
        )
    }
}

