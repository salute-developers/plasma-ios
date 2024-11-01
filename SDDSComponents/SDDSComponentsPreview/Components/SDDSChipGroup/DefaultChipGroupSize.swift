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
public struct DefaultChipGroupSize: ChipGroupSizeConfiguration, Hashable {
    public var debugDescription: String {
        alignment.rawValue
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
    
    public static var allCases: [DefaultChipGroupSize] {
        [.init(alignment: .center), .init(alignment: .left), .init(alignment: .right), .init(alignment: .decreasingLeft), .init(alignment: .decreasingRight)]
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(alignment)
    }
}
