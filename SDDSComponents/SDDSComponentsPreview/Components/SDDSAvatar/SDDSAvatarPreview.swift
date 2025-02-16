import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSAvatarPreview: PreviewProvider {
    static var previews: some View {
        SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            accessibility: AvatarAccessibility()
        )
        .environment(\.avatarAppearance, SDDSAvatar.default.large.appearance)
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
