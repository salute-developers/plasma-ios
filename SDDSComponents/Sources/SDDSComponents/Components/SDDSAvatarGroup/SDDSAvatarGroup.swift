import SwiftUI

// MARK: - SDDSAvatarGroup

/**
 `SDDSAvatarGroup` представляет собой группу аватаров, отображаемых в ряд с наложением и обводкой между ними.

 - Properties:
    - data: Массив данных аватаров для отображения.
    - lastAvatar: Данные для последнего аватара, который отображается, если количество аватаров превышает `maxDisplayingAvatarCount`.
    - size: Конфигурация размеров для группы аватаров, включая максимальное количество отображаемых аватаров, ширину обводки и расстояние между аватарами.
 */
public struct SDDSAvatarGroup: View {
    let data: [SDDSAvatarData]
    let lastAvatar: SDDSAvatarData
    let size: AvatarGroupSizeConfiguration

    public init(
        data: [SDDSAvatarData],
        lastAvatar: SDDSAvatarData,
        size: AvatarGroupSizeConfiguration
    ) {
        self.data = data
        self.lastAvatar = lastAvatar
        self.size = size
    }

    public var body: some View {
        HStack(spacing: -size.borderWidth - size.spacing) {
            ForEach(displayingAvatars, id: \.id) { avatarData in
                SDDSAvatar(data: avatarData)
                    .status(.hidden)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: size.borderWidth)
                    )
                    .zIndex(-Double(data.count) + Double(displayingAvatars.firstIndex(of: avatarData) ?? 0))
            }
        }
    }

    private var displayingAvatars: [SDDSAvatarData] {
        if data.count > size.maxDisplayingAvatarCount {
            return Array(data.prefix(size.maxDisplayingAvatarCount)) + [lastAvatar]
        } else {
            return data
        }
    }
}

// MARK: - AvatarGroupSizeConfiguration

/**
 `AvatarGroupSizeConfiguration` определяет конфигурацию размеров для группы аватаров.

 - Properties:
    - maxDisplayingAvatarCount: Максимальное количество отображаемых аватаров. По умолчанию 3.
    - borderWidth: Ширина обводки между аватарами.
    - spacing: Расстояние между аватарами.
 */
public protocol AvatarGroupSizeConfiguration {
    var maxDisplayingAvatarCount: Int { get }
    var borderWidth: CGFloat { get }
    var spacing: CGFloat { get }
}

// MARK: - Preview

struct SDDSAvatarGroupPreview: PreviewProvider {
    static var previews: some View {
        SDDSAvatarGroup(
            data: exampleAvatars,
            lastAvatar: lastAvatarData,
            size: defaultSize
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }

    static var exampleAvatars: [SDDSAvatarData] {
        [
            SDDSAvatarData(
                text: "JD",
                image: nil,
                placeholderImage: nil,
                status: .online,
                appearance: defaultAppearance,
                size: defaultAvatarSize,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "ML",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultAvatarSize,
                accessibility: defaultAccessibility
            ),
            SDDSAvatarData(
                text: "ML",
                image: .image(Image(systemName: "person.fill")),
                placeholderImage: nil,
                status: .offline,
                appearance: defaultAppearance,
                size: defaultAvatarSize,
                accessibility: defaultAccessibility
            )
        ]
    }

    static var lastAvatarData: SDDSAvatarData {
        SDDSAvatarData(
            text: "+5",
            image: nil,
            placeholderImage: nil,
            status: .hidden,
            appearance: defaultAppearance,
            size: defaultAvatarSize,
            accessibility: defaultAccessibility
        )
    }

    static var defaultAppearance: AvatarAppearance {
        AvatarAppearance(
            textFillStyle: .color(Color.green.token),
            backgroundFillStyle: .color(Color.blue.token),
            onlineStatusColor: .green,
            offlineStatusColor: .red,
            textTypography: AvatarTypography(token: .semibold(32)).asContainer
        )
    }

    static var defaultAvatarSize: AvatarSizeConfiguration {
        DefaultAvatarSize()
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
