import Foundation
import SwiftUI
import SDDSComponents

/**
 Стандартная конфигурация размеров группы чипов.

 - Properties:
    - debugDescription: Описание для отладки.
    - insets: Внутренние отступы.
    - maxColumns: Максимальное количество столбцов в ряду.
    - alignment: Выравнивание группы чипов.
 */
public struct DefaultChipGroupSize: ChipGroupSizeConfiguration {
    public var debugDescription: String {
        String(reflecting: self)
    }
    
    public var insets: EdgeInsets {
        EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
    }
    
    public var maxColumns: Int {
        8
    }
    
    public var alignment: ChipGroupAlignment
    
    public init(alignment: ChipGroupAlignment = .center) {
        self.alignment = alignment
    }
}
