import Foundation
import SwiftUI

/**
 Протокол конфигурации размеров группы чипов.

 - Свойства:
    - insets: Внутренние отступы.
    - maxColumns: Максимальное количество столбцов в строке.
    - alignment: Выравнивание группы чипов.
 */
public protocol ChipGroupSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    func insets(for gap: ChipGroupGap) -> EdgeInsets
    var maxColumns: Int { get }
    var alignment: ChipGroupAlignment { get }
}

public struct ZeroChipGroupSize: ChipGroupSizeConfiguration {
    public var debugDescription: String {
        return "ZeroChipGroupSize"
    }
    
    public func insets(for gap: ChipGroupGap) -> EdgeInsets {
        return EdgeInsets()
    }
    
    public var maxColumns: Int = 0
    
    public var alignment: ChipGroupAlignment = .left
    
    public init() {}
}
