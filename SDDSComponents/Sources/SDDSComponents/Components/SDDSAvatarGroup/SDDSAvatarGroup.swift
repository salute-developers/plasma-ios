import SwiftUI

// MARK: - SDDSAvatarGroup

/**
 `SDDSAvatarGroup` представляет собой группу аватаров, отображаемых в ряд с наложением и обводкой между ними.

 - Parameters:
    - maxDisplayingAvatarCount: Максимальное количество отображаемых аватаров. По умолчанию 3.
    - data: Массив данных аватаров для отображения.
    - lastAvatar: Данные для последнего аватара, который отображается, если количество аватаров превышает.
    - appearance: Параметры внешнего вида (опционально).
    - size: [Deprecated] Конфигурация размеров для группы аватаров, включая максимальное количество отображаемых аватаров, ширину
 обводки и расстояние между аватарами.
 
 ```swift
 SDDSAvatarGroup(
     data: exampleAvatars,
     lastAvatar: lastAvatarData,
     size: defaultSize,
     appearance: AvatarGroup.s.appearance
 )
 //Массив данных аватаров для отображения
 static var exampleAvatars: [SDDSAvatarData] {
     [
         SDDSAvatarData(
             text: "JD",
             image: nil,
             placeholderImage: nil,
             status: .offline,
             appearance: Avatar.l.appearance,
             accessibility: defaultAccessibility
         ),
         SDDSAvatarData(
             text: "ML",
             image: .image(Image(systemName: "person.fill")),
             placeholderImage: nil,
             status: .offline,
             appearance: Avatar.l.appearance,
             accessibility: defaultAccessibility
         ),
         SDDSAvatarData(
             text: "ML",
             image: .image(Image(systemName: "person.fill")),
             placeholderImage: nil,
             status: .offline,
             appearance: Avatar.l.appearance,
             accessibility: defaultAccessibility
         )
     ]
 }
//Данные для последнего аватара
 static var lastAvatarData: SDDSAvatarData {
     SDDSAvatarData(
         text: "+5",
         image: nil,
         placeholderImage: nil,
         status: .hidden,
         appearance: Avatar.l.appearance,
         accessibility: defaultAccessibility
     )
 }
 ```
 */
public struct SDDSAvatarGroup: View {
    let data: [SDDSAvatarData]
    let lastAvatar: SDDSAvatarData
    private let _appearance: AvatarGroupAppearance?
    let maxDisplayingAvatarCount: Int
    @Environment(\.avatarGroupAppearance) private var environmentAppearance

    public init(
        data: [SDDSAvatarData],
        lastAvatar: SDDSAvatarData,
        maxDisplayingAvatarCount: Int = 3,
        appearance: AvatarGroupAppearance? = nil
    ) {
        self.data = data
        self.lastAvatar = lastAvatar
        self.maxDisplayingAvatarCount = maxDisplayingAvatarCount
        self._appearance = appearance
    }

    public var body: some View {
        HStack(spacing: -appearance.size.borderWidth - appearance.size.spacing) {
            ForEach(displayingAvatars, id: \.id) { avatarData in
                SDDSAvatar<AnyView>(data: avatarDataHidden(avatarData: avatarData))
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: appearance.size.borderWidth)
                    )
                    .zIndex(-Double(data.count) + Double(displayingAvatars.firstIndex(of: avatarData) ?? 0))
            }
        }
    }

    private var displayingAvatars: [SDDSAvatarData] {
        if data.count > maxDisplayingAvatarCount {
            return Array(data.prefix(maxDisplayingAvatarCount)) + [lastAvatar]
        } else {
            return data
        }
    }
    
    public var appearance: AvatarGroupAppearance {
        _appearance ?? environmentAppearance
    }
    
    private func avatarDataHidden(avatarData: SDDSAvatarData) -> SDDSAvatarData {
        SDDSAvatarData(
            text: avatarData.text,
            image: avatarData.image,
            placeholderImage: avatarData.placeholderImage,
            status: .hidden,
            appearance: appearance.avatarAppearance,
            accessibility: avatarData.accessibility,
            extra: avatarData.extra
        )
    }
}

// MARK: - AvatarGroupSizeConfiguration

/**
 `AvatarGroupSizeConfiguration` определяет конфигурацию размеров для группы аватаров.

 - Properties:
    - borderWidth: Ширина обводки между аватарами.
    - spacing: Расстояние между аватарами.
 */
public protocol AvatarGroupSizeConfiguration {
    var borderWidth: CGFloat { get }
    var spacing: CGFloat { get }
}
