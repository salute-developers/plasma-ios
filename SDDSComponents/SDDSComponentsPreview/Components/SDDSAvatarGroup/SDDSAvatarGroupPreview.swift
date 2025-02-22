import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

// MARK: - Preview

struct AvatarGroupPreview: PreviewProvider {
    static var previews: some View {
        AvatarGroup(
            data: exampleAvatars,
            lastAvatar: lastAvatarData,
            size: defaultSize
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }

    static var exampleAvatars: [AvatarData] {
        [
            AvatarData(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            ),
            AvatarData(
                text: "ML",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            ),
            AvatarData(
                text: "ML",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: Avatar.l.default.appearance,
                accessibility: defaultAccessibility
            )
        ]
    }

    static var lastAvatarData: AvatarData {
        AvatarData(
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

    static var defaultSize: AvatarGroupSizeConfiguration {
        DefaultAvatarGroupSize()
    }
}

// MARK: - DefaultAvatarGroupSize

/**
 `DefaultAvatarGroupSize` представляет собой реализацию конфигурации размеров для группы аватаров по умолчанию.

 - Properties:
    - maxDisplayingAvatarCount: Максимальное количество отображаемых аватаров, по умолчанию 3.
    - borderWidth: Ширина обводки между аватарами.
    - spacing: Расстояние между аватарами.
 */
struct DefaultAvatarGroupSize: AvatarGroupSizeConfiguration {
    var maxDisplayingAvatarCount: Int { 3 }
    var borderWidth: CGFloat { 4 }
    var spacing: CGFloat { 15 }
}
