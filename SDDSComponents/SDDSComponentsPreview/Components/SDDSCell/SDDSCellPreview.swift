import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSCellPreview: PreviewProvider {
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
            )
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
