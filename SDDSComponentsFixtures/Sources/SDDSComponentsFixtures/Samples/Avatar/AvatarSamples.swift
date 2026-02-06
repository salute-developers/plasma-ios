import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSAvatar_Simple: View {
    var body: some View {
        SDDSAvatar(
            text: "JD",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.l.appearance,
            accessibility: AvatarAccessibility()
        )
    }
}
