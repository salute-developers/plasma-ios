import Foundation
import SwiftUI

/**
 Структура `CellContentRight` представляет правый контент ячейки, включая массив представлений и флаг включения дискложура.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`), используемых в контенте ячейки.
    - disclosure: Необязательный параметр, представляющий дискложур.

 - Initializer:
    - init(data:disclosure:): Инициализирует новый экземпляр `CellContentRight` с указанным массивом представлений и дискложуром.
 */
public struct CellContentRight {
    public var contentView: [CellCustomViewProvider]
//    public var availableViews: [ViewCase]

    public init(
        contentView: [CellCustomViewProvider] = []
    ) {
        self.contentView = contentView
    }
}

