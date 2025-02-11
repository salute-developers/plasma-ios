import Foundation
import SwiftUI

/**
 Структура `CellContentCenter` представляет центральный контент ячейки, включая массив представлений, метку, заголовок и подзаголовок.

 - Properties:
    - contentView: Массив представлений (`CellCustomViewProvider`).
    - label: Метка центрального контента.
    - title: Заголовок центрального контента.
    - subtitle: Подзаголовок центрального контента.

 - Initializer:
    - init(contentView:label:title:subtitle:): Инициализатор для создания экземпляра `CellContentCenter`.
 */
public struct CellContentCenter: CellContentConfiguration {
    public let contentView: [CellCustomViewProvider]
    public var label: String
    public var title: String
    public var subtitle: String

    public init(
        contentView: [CellCustomViewProvider] = [],
        label: String = "",
        title: String = "",
        subtitle: String = ""
    ) {
        self.contentView = contentView
        self.label = label
        self.title = title
        self.subtitle = subtitle
    }
    
    public var allText: [String] {
        [
            label,
            title,
            subtitle
        ]
    }
}
