import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSCellPreview: PreviewProvider {
    static var iconButton: IconButton {
        IconButton(
            iconAttributes: .init(image: Image.image("plasma"), alignment: .leading),
            isDisabled: false,
            isLoading: false,
            spinnerImage: Image.image("spinner"),
            appearance: IconButton.large.accent.appearance,
            layoutMode: .fixedWidth(.packed),
            action: {}
        )
    }
    
    static var avatar: SDDSAvatar {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            appearance: SDDSAvatar.extraExtraLarge.medium.appearance,
            accessibility: AvatarAccessibility()
        )
    }
    
    static var previews: some View {
        SDDSCell(
            leftContent: .avatar(avatar),
            centerContent: CellContentCenter(
                label: "Label",
                title: "Title",
                subtitle: "Subtitle"
            ),
            rightContent: CellContentRight(
                disclosureEnabled: false,
                view: ViewProvider(iconButton)
            )
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
