import Foundation
import SwiftUI

/**
 Протокол `CellContentConfiguration` определяет конфигурацию контента ячейки, включая массив представлений.

 - Properties:
    - data: Массив представлений (`CellCustomViewProvider`), используемых в контенте ячейки.
 */
public protocol CellContentConfiguration {
    var contentView: [CellCustomViewProvider] { get }
}
