import SwiftUI
import Combine
import SDDSComponents
import SDDSThemeCore
import SDDSIcons

final class AvatarGroupViewModel: ComponentViewModel<AvatarGroupVariationProvider>, ViewModelDelegate {
    @Published var avatarData: [SDDSAvatarData] = []
    @Published var lastAvatar: SDDSAvatarData = SDDSAvatarData()
    @Published var maxDisplayingAvatarCount: Int = 3
    @Published var borderWidth: CGFloat = 4
    @Published var spacing: CGFloat = 15
    var avatarViewModel = AvatarViewModel()
    
    init(theme: Theme = .sdddsServTheme, uiState: AvatarGroupUiState = .init()) {
        super.init(variationProvider: AvatarGroupVariationProvider(theme: theme), theme: theme)
        avatarViewModel = AvatarViewModel(theme: theme)
        avatarViewModel.delegate = self
        if uiState.avatarData.isEmpty {
            avatarData = defaultAvatars
            lastAvatar = defaultLastAvatar
        } else {
            avatarData = uiState.avatarData
            lastAvatar = uiState.lastAvatar
        }
        maxDisplayingAvatarCount = uiState.maxDisplayingAvatarCount
        borderWidth = uiState.borderWidth
        spacing = uiState.spacing
        applySandboxVariationAppearance(variant: uiState.variant, appearance: uiState.appearance)
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
                image: nil,
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "ML",
                image: nil,
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "SP",
                image: nil,
                placeholderImage: nil,
                appearance: avatarViewModel.appearance,
                accessibility: defaultAccessibility
            )
        ]
    }

    var defaultLastAvatar: SDDSAvatarData {
        SDDSAvatarData(
            text: "+5",
            image: nil,
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
