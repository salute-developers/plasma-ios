import Foundation
import SwiftUI

/**
 Структура `CellContentCenter` представляет центральный контент ячейки, включая массив представлений, метку, заголовок и подзаголовок.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`).
    - label: Метка центрального контента.
    - title: Заголовок центрального контента.
    - subtitle: Подзаголовок центрального контента.

 - Initializer:
    - init(data:label:title:subtitle:): Инициализатор для создания экземпляра `CellContentCenter`.
 */
public struct CellContentCenter: CellContentConfiguration {
    public let data: [CellCustomViewProvider]
    public var label: String
    public var title: String
    public var subtitle: String

    public init(
        data: [CellCustomViewProvider] = [],
        label: String = "",
        title: String = "",
        subtitle: String = ""
    ) {
        self.data = data
        self.label = label
        self.title = title
        self.subtitle = subtitle
    }
}
