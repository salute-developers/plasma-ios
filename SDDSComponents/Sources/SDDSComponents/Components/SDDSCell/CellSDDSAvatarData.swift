import Foundation
import SwiftUI

public struct CellSDDSAvatarData {
    let id = UUID()
    public let text: String
    public let image: AvatarImageSource?
    public let placeholderImage: AvatarImageSource?
    public let status: AvatarStatus
    public let appearance: AvatarAppearance
    public let accessibility: AvatarAccessibility

    /**
     Инициализатор для создания `SDDSAvatarData`.

     - Parameters:
        - text: Текст, который отображается, если нет изображения; обычно инициалы.
        - image: Изображение аватара, передается как `AvatarImageSource`.
        - placeholderImage: Изображение-заглушка, отображаемое при отсутствии основного изображения.
        - status: Статус аватара (`hidden`, `online`, `offline`).
        - appearance: Параметры внешнего вида аватара.
        - accessibility: Параметры доступности для аватара.
     */
    public init(
        text: String,
        image: AvatarImageSource? = nil,
        placeholderImage: AvatarImageSource? = nil,
        status: AvatarStatus = .hidden,
        appearance: AvatarAppearance,
        accessibility: AvatarAccessibility = AvatarAccessibility()
    ) {
        self.text = text
        self.image = image
        self.placeholderImage = placeholderImage
        self.status = status
        self.appearance = appearance
        self.accessibility = accessibility
    }
}

extension CellSDDSAvatarData: Hashable {
    public static func == (lhs: CellSDDSAvatarData, rhs: CellSDDSAvatarData) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
