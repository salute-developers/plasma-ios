import Foundation
import SwiftUI
import SDDSComponents

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
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .online,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .online,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Online - Placeholder with Text")

            // Offline Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .offline,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Offline - Placeholder with Text")
            
            // Hidden Status Previews
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Text Only")
            
            SDDSAvatar(
                text: "",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Image")
            
            SDDSAvatar(
                text: "JD",
                image: nil,
                placeholderImage: .image(Image(systemName: "person")),
                status: .hidden,
                appearance: defaultAppearance,
                size: defaultSize,
                accessibility: defaultAccessibility
            )
            .previewDisplayName("Hidden - Placeholder with Text")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
    
    static var defaultAppearance: AvatarAppearance {
        AvatarAppearance(
            textFillStyle: .color(Color.green.token),
            backgroundFillStyle: .color(Color.blue.token),
            onlineStatusColor: .green,
            offlineStatusColor: .red,
            textTypography: AvatarTypography(token: .semibold18).asContainer
        )
    }
    
    static var defaultSize: AvatarSizeConfiguration {
        return DefaultAvatarSize()
    }
    
    static var defaultAccessibility: AvatarAccessibility {
        AvatarAccessibility(label: "User Avatar", hint: "Displays user status and initials or image")
    }
}

struct DefaultAvatarSize: AvatarSizeConfiguration {
    var avatarSize: CGSize { CGSize(width: 88, height: 88) }
    var statusSize: CGSize { CGSize(width: 12, height: 12) }
    var statusInsets: EdgeInsets { EdgeInsets(top: 69, leading: 69, bottom: 0, trailing: 0) }
}

struct AvatarTypography: GeneralTypographyConfiguration {
    let token: TypographyToken
    
    func typography(with size: AvatarSizeConfiguration) -> TypographyToken? {
        return token
    }
}
