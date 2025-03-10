import Foundation
import SwiftUI


public struct IconButton: View {
    public let iconAttributes: ButtonIconAttributes?
    public let isDisabled: Bool
    public let isLoading: Bool
    public let spinnerImage: Image
    public let layoutMode: ButtonLayoutMode
    public let accessibility: ButtonAccessibility
    public var action: () -> Void
    private var _appearance: ButtonAppearance?
    private var appearance: ButtonAppearance {
        _appearance ?? buttonAppearance
    }
    
    @Environment(\.buttonAppearance) var buttonAppearance
    
    public init(
        iconAttributes: ButtonIconAttributes? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        spinnerImage: Image = Image("spinner", bundle: Bundle(for: Components.self)),
        appearance: ButtonAppearance? = nil,
        layoutMode: ButtonLayoutMode = .wrapContent,
        accessibility: ButtonAccessibility = ButtonAccessibility(),
        action: @escaping () -> Void
    ) {
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
            title: "",
            subtitle: "",
            iconAttributes: iconAttributes,
            isDisabled: isDisabled,
            isLoading: isLoading,
            spinnerImage: spinnerImage,
            buttonStyle: .icon,
            appearance: appearance,
            layoutMode: layoutMode,
            accessibility: accessibility,
            action: action
        )
    }
}
