import Foundation
import PlasmaB2CTheme
import SwiftUI
import SDDSComponents

public extension SDDSButton {
    
    static func basicButton(
        title: String,
        subtitle: String = "",
        iconAttributes: ButtonIconAttributes? = nil,
        size: ButtonSize,
        style: PlasmaB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponents.Components.self)),
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
            appearance: style.defaultAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }

    static func circleButton(
        iconImage: Image,
        size: ButtonSize,
        style: PlasmaB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponents.Components.self)),
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
            appearance: style.defaultAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }

    static func squareButton(
        iconImage: Image,
        size: ButtonSize,
        style: PlasmaB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponents.Components.self)),
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
            appearance: style.defaultAppearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }
    
    static func linkButton(
        title: String,
        iconAttributes: ButtonIconAttributes? = nil,
        size: LinkSize,
        style: PlasmaB2CStyle,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: SDDSComponents.Components.self)),
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
            appearance: style.linkAppearance,
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
        //Theme.initialize()
        
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

struct PlasmsB2CButtonPreview: PreviewProvider {
    static var previews: some View {
        
        SDDSButton.basicButton(
            title: "Title",
            subtitle: "Subtitle",
            iconAttributes: ButtonIconAttributes(
                image: Image(systemName: "paperplane.fill"),
                alignment: .left
            ),
            size: .medium,
            style: .warning,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Basic Button")
        
        SDDSButton.linkButton(
            title: "Title",
            iconAttributes: .init(image: Image(systemName: "paperplane.fill"), alignment: .left),
            size: .medium,
            style: .warning,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Link Button")
        
        SDDSButton.circleButton(
            iconImage: Image(systemName: "paperplane.fill"),
            size: .medium,
            style: .warning,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Circle Button")
        
        SDDSButton.squareButton(
            iconImage: Image(systemName: "paperplane.fill"),
            size: .medium,
            style: .negative,
            isDisabled: false,
            isLoading: false,
            spinnerStyle: .solid,
            layoutMode: .wrapContent,
            action: {}
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Square Button")
    }
}
