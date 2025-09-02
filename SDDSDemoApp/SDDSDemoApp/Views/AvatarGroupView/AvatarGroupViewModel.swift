import SwiftUI
import Combine
import SDDSComponents
import SDDSservTheme

final class AvatarGroupViewModel: ComponentViewModel<AvatarGroupVariationProvider>, ViewModelDelegate {
    @Published var avatarData: [SDDSAvatarData] = []
    @Published var lastAvatar: SDDSAvatarData = SDDSAvatarData()
    @Published var maxDisplayingAvatarCount: Int = 3
    @Published var borderWidth: CGFloat = 4
    @Published var spacing: CGFloat = 15
    var avatarViewModel = AvatarViewModel()
    
    init() {
        super.init(variationProvider: AvatarGroupVariationProvider())
        self.avatarData = defaultAvatars
        self.lastAvatar = defaultLastAvatar
        avatarViewModel.delegate = self
    }
    
    var sizeConfiguration: AvatarGroupSizeConfiguration {
          DefaultAvatarGroupSize(
              maxDisplayingAvatarCount: maxDisplayingAvatarCount,
              borderWidth: borderWidth,
              spacing: spacing
          )
      }

    var defaultAvatars: [SDDSAvatarData] {
        [
            SDDSAvatarData(
                text: "JD",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "ML",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "SP",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            )
        ]
    }

    var defaultLastAvatar: SDDSAvatarData {
        SDDSAvatarData(
            text: "+5",
            image: .image(Image.image("checker")),
            placeholderImage: nil,
            status: .hidden,
            appearance: avatarViewModel.appearance,
            accessibility: defaultAccessibility
        )
    }

    var defaultAccessibility: AvatarAccessibility {
        AvatarAccessibility(label: "User Avatar", hint: "Displays user status and initials or image")
    }
    
    func updateAppearance() {
        appearance.avatarAppearance = avatarViewModel.appearance
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
