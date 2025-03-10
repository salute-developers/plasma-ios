import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSAvatarPreview: PreviewProvider {
    static var previews: some View {
        Theme.initialize()
        return SDDSAvatar(
            text: "",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .online,
            accessibility: AvatarAccessibility()
        )
        .previewLayout(.sizeThatFits)
        .previewDisplayName("Default")
    }
}
