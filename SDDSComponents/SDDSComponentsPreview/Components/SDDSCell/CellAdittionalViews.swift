import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme
import SDDSIcons

struct CellAdditionalPreview: PreviewProvider {
    static var iconButton: CellCustomViewProvider {
        CellCustomViewProvider(
            view: IconButton(
                iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
                isDisabled: false,
                isLoading: false,
                spinnerImage: Image.image("spinner"),
                appearance: IconButton.large.clear.appearance,
                layoutMode: .fixedWidth(.packed),
                action: {}
            )
        )
    }
    
    static var switchView: PreviewProvider {
        CellCustomViewProvider(
            view: SDDSSwitch(
                title: "Label",
                subtitle: "Description",
                isOn: .constant(true),
                isEnabled: true,
                appearance: SDDSSwitch.large.default.appearance,
                switchAccessibility: SwitchAccessibility()
            )
        )
    }
    
    static var avatar: CellCustomViewProvider {
        CellCustomViewProvider(
            view: SDDSAvatar(
                text: "",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                status: .online,
                appearance: SDDSAvatar.extraExtraLarge.large.appearance,
                accessibility: AvatarAccessibility()
            )
        )
    }
}
