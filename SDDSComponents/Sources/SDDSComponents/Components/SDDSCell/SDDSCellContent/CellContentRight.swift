import Foundation
import SwiftUI

/**
 Структура `CellContentRight` представляет правый контент ячейки, включая массив представлений и флаг включения дискложура.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`).
    - disclosureEnabled: Флаг, указывающий, включен ли дискложур.

 - Initializer:
    - init(data:disclosureEnabled:): Инициализатор для создания экземпляра `CellContentRight`.
 */
public struct CellContentRight: CellContentConfiguration {
    public let data: [CellCustomViewProvider]
    public let disclosureEnabled: Bool
    
    public init(
        data: [CellCustomViewProvider] = [],
        disclosureEnabled: Bool
    ) {
        self.data = data
        self.disclosureEnabled = disclosureEnabled
    }
}
