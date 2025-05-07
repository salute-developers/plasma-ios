import Foundation
import SwiftUI

/**
 `SDDSAvatarData` представляет собой структуру, содержащую все параметры, необходимые для создания аватара с использованием `SDDSAvatar`.

 - Properties:
    - text: Текст, который отображается, если нет изображения; обычно инициалы.
    - image: Изображение аватара, передается как `AvatarImageSource`.
    - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
    - status: Статус аватара (`hidden`, `online`, `offline`).
    - appearance: Параметры внешнего вида аватара.
    - size: Конфигурация размеров для аватара.
    - accessibility: Параметры доступности для аватара.
 */
public struct SDDSAvatarData {
    let id = UUID()
    public let text: String
    public let image: AvatarImageSource?
    public let placeholderImage: AvatarImageSource?
    public let status: AvatarStatus
    public let extra: AvatarExtra<AnyView>
    public let appearance: AvatarAppearance
    public let accessibility: AvatarAccessibility

    /**
     Инициализатор для создания `SDDSAvatarData`.

     - Parameters:
        - text: Текст, который отображается, если нет изображения; обычно инициалы.
        - image: Изображение аватара, передается как `AvatarImageSource`.
        - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
        - status: Статус аватара (`hidden`, `online`, `offline`).
        - extraContent: Extra контент. (`Badge`, `Counter`).
        - appearance: Параметры внешнего вида аватара.
        - accessibility: Параметры доступности для аватара.
     */
    public init(
        text: String = "",
        image: AvatarImageSource? = nil,
        placeholderImage: AvatarImageSource? = nil,
        status: AvatarStatus = .hidden,
        appearance: AvatarAppearance = AvatarAppearance(),
        accessibility: AvatarAccessibility = AvatarAccessibility(),
        extra: AvatarExtra<AnyView> = .init(placement: .none) { AnyView(EmptyView()) }
    ) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self.extra = extra
        self.appearance = appearance
        self.accessibility = accessibility
    }
}

extension SDDSAvatarData: Equatable {
    public static func == (lhs: SDDSAvatarData, rhs: SDDSAvatarData) -> Bool {
        return lhs.id == rhs.id
    }
}
