import Foundation
import SwiftUI

/**
 Структура `CellCustomViewProvider` представляет собой оболочку для любого представления (`View`), которое может быть использовано в контенте ячейки.

 - Properties:
    - id: Уникальный идентификатор для представления, используемый для хеширования и сравнения.
    - view: Представление (`View`), которое будет отображаться в ячейке.

 - Initializer:
    - init(id:view:): Инициализатор для создания экземпляра `CellCustomViewProvider` с уникальным идентификатором и представлением.

 - Methods:
    - hash(into:): Метод для вычисления хеша объекта, используя уникальный идентификатор.
    - ==: Оператор сравнения для проверки равенства двух экземпляров `CellCustomViewProvider` на основе их уникальных идентификаторов.
 */
public struct CellCustomViewProvider: View, Hashable {
    let id: UUID
    let view: AnyView

    /**
     Инициализатор для создания экземпляра `CellCustomViewProvider` с уникальным идентификатором и представлением.

     - Parameters:
        - id: Уникальный идентификатор для представления. По умолчанию генерируется новый UUID.
        - view: Представление (`View`), которое будет отображаться в ячейке.
     */
    public init<V: View>(
        id: UUID = UUID(),
        view: V
    ) {
        self.id = id
        self.view = AnyView(view)
    }

    public var body: some View {
        view
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func ==(lhs: CellCustomViewProvider, rhs: CellCustomViewProvider) -> Bool {
        lhs.id == rhs.id
    }
}
