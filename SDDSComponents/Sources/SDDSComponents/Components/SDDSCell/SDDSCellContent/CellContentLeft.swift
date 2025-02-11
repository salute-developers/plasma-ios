import Foundation
import SwiftUI

/**
 Структура `CellContentLeft` представляет левый контент ячейки, включая массив представлений.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`).

 - Initializer:
    - init(data:): Инициализатор для создания экземпляра `CellContentLeft`.
 */
public struct CellContentLeft: CellContentConfiguration {
    public var data: [CellCustomViewProvider]
    
    public init(data: [CellCustomViewProvider] = []) {
        self.data = data
    }
}
