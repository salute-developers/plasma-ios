import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

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
    
    static var text: some View {
           Text("Custom text")
    }
    
    static var avatar: SDDSAvatar {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: nil,
            accessibility: AvatarAccessibility()
        )
    }
    
    static var `switch`: SDDSSwitch {
        SDDSSwitch(
            title: "",
            subtitle: "",
            isOn: .constant(false),
            isEnabled: true,
            appearance: SDDSSwitch.large.default.appearance,
            switchAccessibility: SwitchAccessibility()
        )
    }
}
