import Foundation
import SDDSApiInfo
import SwiftUI

/**
 Протокол конфигурации размеров группы чипов.

 - Свойства:
    - insets: Внутренние отступы.
    - maxColumns: Максимальное количество столбцов в строке.
    - alignment: Выравнивание группы чипов.
 */
public protocol ChipGroupSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    @available(*, deprecated, message: "use 'appearance' instead")
    @ApiIgnore()
    func insets(for gap: ChipGroupGap) -> EdgeInsets
    @ApiValue("Int(0)", zero: "Int(0)")
    var maxColumns: Int { get }
    @ApiValue("ChipGroupAlignment.left")
    var alignment: ChipGroupAlignment { get }
    var gap: CGFloat { get }
    var lineSpacing: CGFloat { get }
}

/// Функция депрекейтнута и в конфигурациях оформления её нет: генерация её не печатает,
/// поэтому реализацию даёт сам протокол.
public extension ChipGroupSizeConfiguration {
    func insets(for gap: ChipGroupGap) -> EdgeInsets { EdgeInsets() }
}

public struct ZeroChipGroupSize: ChipGroupSizeConfiguration {
    public var gap: CGFloat = 0
    
    public var lineSpacing: CGFloat = 0
    
    public var debugDescription: String {
        return "ZeroChipGroupSize"
    }
    
    public func insets(for gap: ChipGroupGap) -> EdgeInsets {
        EdgeInsets()
    }
    
    public var maxColumns: Int = 0
    
    public var alignment: ChipGroupAlignment = .left
    
    public init() {}
}
