import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// swiftlint:disable function_parameter_count
extension SDDSButton {
    
    static func basicButton(
        title: String,
        subtitle: String = "",
        iconAttributes: ButtonIconAttributes? = nil,
        size: ButtonSize,
        style: SDDSServeB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponentsPreview.self)),
        spinnerStyle: SpinnerStyle = .solid,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) -> SDDSButton {
        button(
            title: title,
            subtitle: subtitle,
            iconAttributes: iconAttributes,
            size: size,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            spinnerStyle: spinnerStyle,
            buttonStyle: .basic,
            appearance: style.defaultButtonAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }

    static func iconButtonCircle(
        iconImage: Image,
        size: ButtonSize,
        style: SDDSServeB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponentsPreview.self)),
        spinnerStyle: SpinnerStyle = .solid,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) -> SDDSButton {
        button(
            title: "",
            subtitle: "",
            iconAttributes: ButtonIconAttributes(image: iconImage, alignment: .left),
            size: size,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            spinnerStyle: spinnerStyle,
            buttonStyle: .circle,
            appearance: style.defaultButtonAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }

    static func iconButtonSquare(
        iconImage: Image,
        size: ButtonSize,
        style: SDDSServeB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponentsPreview.self)),
        spinnerStyle: SpinnerStyle = .solid,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) -> SDDSButton {
        button(
            title: "",
            subtitle: "",
            iconAttributes: ButtonIconAttributes(image: iconImage, alignment: .left),
            size: size,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            spinnerStyle: spinnerStyle,
            buttonStyle: .square,
            appearance: style.defaultButtonAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }
    
    static func linkButton(
        title: String,
        iconAttributes: ButtonIconAttributes? = nil,
        size: LinkSize,
        style: SDDSServeB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponentsPreview.self)),
        spinnerStyle: SpinnerStyle = .solid,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) -> SDDSButton {
        button(
            title: title,
            subtitle: "",
            iconAttributes: iconAttributes,
            size: size.buttonSize,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            spinnerStyle: spinnerStyle,
            buttonStyle: .basic,
            appearance: style.defaultLinkButtonAppearance,
            layoutMode: .wrapContent,
            accessibility: accessibility,
            action: action
        )
    }
}

private extension SDDSButton {
    static func button(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes?,
        size: ButtonSize,
        isDisabled: Bool,
        isLoading: Bool,
        spinnerImage: Image,
        spinnerStyle: SpinnerStyle,
        buttonStyle: SDDSComponents.ButtonStyle,
        appearance: ButtonAppearance,
        layoutMode: ButtonLayoutMode,
        accessibility: ButtonAccessibility,
        action: @escaping () -> Void
    ) -> SDDSButton {
        return SDDSButton(
            title: title,
            subtitle: subtitle,
            iconAttributes: iconAttributes,
            size: size,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            spinnerStyle: spinnerStyle,
            buttonStyle: buttonStyle,
            appearance: appearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }
}
// swiftlint:enable function_parameter_count
