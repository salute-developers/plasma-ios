import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

extension CellPreview {    
    static var checkbox: some View {
        SDDSCheckbox(
            state: .constant(.indeterminate),
            title: "Valur",
            subtitle: "Description",
            isEnabled: true,
            images: .checkbox
        )
    }
    
    static var radiobox: some View {
        SDDSRadiobox(
            isSelected: .constant(true),
            title: "Value",
            subtitle: "Description",
            isEnabled: true,
            images: .defaultImages
        )
    }
    
    static var avatar: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            accessibility: AvatarAccessibility()
        )
    }
    
    static var `switch`: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(false),
            isEnabled: true,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
