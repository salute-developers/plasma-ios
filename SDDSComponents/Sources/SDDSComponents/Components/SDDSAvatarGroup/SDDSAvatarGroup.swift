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
                SDDSAvatar<AnyView>(data: avatarDataHidden(avatarData: avatarData))
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
    
    private func avatarDataHidden(avatarData: SDDSAvatarData) -> SDDSAvatarData {
        SDDSAvatarData(
            text: avatarData.text,
            image: avatarData.image,
            placeholderImage: avatarData.placeholderImage,
            status: .hidden,
            extraContent: avatarData.extraContent,
            appearance: avatarData.appearance,
            accessibility: avatarData.accessibility
        )
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
