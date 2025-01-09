import Foundation
import SwiftUI

public struct BasicButton: View {
    public let title: String
    public let subtitle: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image
    public let appearance: ButtonAppearance
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public var action: () -> Void
    
    public init(
        title: String,
        subtitle: String,
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self)),
        appearance: ButtonAppearance,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self.appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.action = action
    }
    
    public var body: some View {
        SDDSButton(
            title: title,
            subtitle: subtitle,
            iconAttributes: iconAttributes,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            buttonStyle: .basic,
            appearance: appearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            counterView: nil,
            action: action
        )
    }
}
