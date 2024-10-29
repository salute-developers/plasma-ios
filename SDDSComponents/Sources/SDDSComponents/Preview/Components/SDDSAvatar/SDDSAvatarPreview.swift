import Foundation
import SwiftUI

@_exported import SDDSservTheme

// MARK: - Preview

struct SDDSAvatarPreview: PreviewProvider {
    static var previews: some View {
        Group {
            // Online Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                status: .online,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image.image("checker")),
                status: .online,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Placeholder with Text")

            // Offline Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .offline,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                status: .offline,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image.image("checker")),
                status: .offline,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Placeholder with Text")
            
            // Hidden Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .hidden,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image.image("checker")),
                placeholderImage: nil,
                status: .hidden,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image.image("checker")),
                status: .hidden,
                appearance: .default,
                size: DefaultAvatarSize.extraExtraLarge,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Placeholder with Text")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
    
    private static var defaultAccessibility: AvatarAccessibility {
        AvatarAccessibility(label: "User Avatar", hint: "Displays user status and initials or image")
    }
}
