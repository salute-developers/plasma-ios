import SwiftUI

// MARK: - AvatarGroup

/**
 `AvatarGroup` представляет собой группу аватаров, отображаемых в ряд с наложением и обводкой между ними.

 - Properties:
    - data: Массив данных аватаров для отображения.
    - lastAvatar: Данные для последнего аватара, который отображается, если количество аватаров превышает `maxDisplayingAvatarCount`.
    - size: Конфигурация размеров для группы аватаров, включая максимальное количество отображаемых аватаров, ширину обводки и расстояние между аватарами.
 */
public struct AvatarGroup: View {
    let data: [AvatarData]
    let lastAvatar: AvatarData
    let size: AvatarGroupSizeConfiguration

    public init(
        data: [AvatarData],
        lastAvatar: AvatarData,
        size: AvatarGroupSizeConfiguration
    ) {
        self.data = data
        self.lastAvatar = lastAvatar
        self.size = size
    }

    public var body: some View {
        HStack(spacing: -size.borderWidth - size.spacing) {
            ForEach(displayingAvatars, id: \.id) { avatarData in
                Avatar(data: avatarData)
                    .status(.hidden)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: size.borderWidth)
                    )
                    .zIndex(-Double(data.count) + Double(displayingAvatars.firstIndex(of: avatarData) ?? 0))
            }
        }
    }

    private var displayingAvatars: [AvatarData] {
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
