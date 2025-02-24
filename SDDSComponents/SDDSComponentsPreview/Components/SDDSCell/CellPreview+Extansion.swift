import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

extension CellPreview {
    static var iconButton: some View {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.l.accent.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
    
    static var checkbox: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Valur",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox,
            appearance: Checkbox.m.default.appearance
        )
    }
    
    static var radiobox: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Valur",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox,
            appearance: Checkbox.m.default.appearance
        )
    }
    
    static var avatar: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: Avatar.l.default.appearance,
            accessibility: AvatarAccessibility()
        )
    }
    
    static var `switch`: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(false),
            isEnabled: true,
            appearance: Switch.l.default.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
