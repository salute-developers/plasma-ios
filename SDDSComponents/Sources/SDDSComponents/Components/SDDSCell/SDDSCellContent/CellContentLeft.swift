import Foundation
import SwiftUI

/**
 Структура `CellContentLeft` представляет левый контент ячейки, включая массив представлений.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`).

 - Initializer:
    - init(contentView:): Инициализатор для создания экземпляра `CellContentLeft`.
 */
public struct CellContentLeft: CellContentConfiguration {
    public var contentView: [CellCustomViewProvider]
    
    public init(contentView: [CellCustomViewProvider] = []) {
        self.contentView = contentView
    }
}
