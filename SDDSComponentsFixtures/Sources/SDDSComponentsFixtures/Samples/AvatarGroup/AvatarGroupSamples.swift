import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSAvatarGroup_Simple: View {
    private static let exampleAvatars: [SDDSAvatarData] = [
        SDDSAvatarData(
            text: "JD",
            image: nil,
            placeholderImage: nil,
            status: .offline,
            accessibility: AvatarAccessibility()
        ),
        SDDSAvatarData(
            text: "ML",
            image: nil,
            placeholderImage: nil,
            status: .offline,
            accessibility: AvatarAccessibility()
        )
    ]

    private static let lastAvatarData = SDDSAvatarData(
        text: "+5",
        image: nil,
        placeholderImage: nil,
        status: .hidden,
        accessibility: AvatarAccessibility()
    )

    var body: some View {
        SDDSAvatarGroup(
            data: Self.exampleAvatars,
            lastAvatar: Self.lastAvatarData,
            maxDisplayingAvatarCount: 3
        )
    }
}
