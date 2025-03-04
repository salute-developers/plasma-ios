import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

final class AvatarGroupViewModel: ObservableObject {
    @Published var avatarData: [SDDSAvatarData] = AvatarGroupViewModel.defaultAvatars
    @Published var lastAvatar: SDDSAvatarData = AvatarGroupViewModel.defaultLastAvatar
    @Published var maxDisplayingAvatarCount: Int = 3
    @Published var borderWidth: CGFloat = 4
    @Published var spacing: CGFloat = 15

    var sizeConfiguration: AvatarGroupSizeConfiguration {
        DefaultAvatarGroupSize(
            maxDisplayingAvatarCount: maxDisplayingAvatarCount,
            borderWidth: borderWidth,
            spacing: spacing
        )
    }

    static var defaultAvatars: [SDDSAvatarData] {
        [
            SDDSAvatarData(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "ML",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                status: .offline,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "SP",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            ),
        ]
    }

    static var defaultLastAvatar: SDDSAvatarData {
        SDDSAvatarData(
            text: "+5",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: Avatar.l.default.appearance,
            accessibility: defaultAccessibility
        )
    }

    static var defaultAccessibility: AvatarAccessibility {
        AvatarAccessibility(label: "User Avatar", hint: "Displays user status and initials or image")
    }
}

struct DefaultAvatarGroupSize: AvatarGroupSizeConfiguration {
    var maxDisplayingAvatarCount: Int
    var borderWidth: CGFloat
    var spacing: CGFloat
}

struct AvatarGroupView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarGroupView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
