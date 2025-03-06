import Foundation
import SwiftUI

public struct LinkButton: View {
    public let title: String
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image
    private let _appearance: ButtonAppearance?
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public var action: () -> Void
    
    public init(
        title: String,
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self)),
        appearance: ButtonAppearance? = nil,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.iconAttributes = iconAttributes
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.spinnerImage = spinnerImage
        self._appearance = appearance
        self.layoutMode = layoutMode
        self.accessibility = accessibility
        self.action = action
    }
    
    public var body: some View {
        SDDSButton(
            title: title,
            subtitle: "",
            iconAttributes: iconAttributes,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            buttonStyle: .basic,
            appearance: _appearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }
}
