import Foundation
import SwiftUI

/**
 Протокол `CellSizeConfiguration` определяет отступы и расположение контента в ячейке, которые можно настроить для различных стилей и вариантов ячеек.

 - Properties:
    - contentPaddingStart: Отступ между контентом в начале и контентом в середине.
    - contentPaddingEnd: Отступ между контентом в конце и контентом в середине.
 */
public protocol CellSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var contentPaddingStart: CGFloat { get }
    var contentPaddingEnd: CGFloat { get }
}

public struct ZeroCellSize: CellSizeConfiguration {
    public var contentPaddingStart: CGFloat = 0
    public var contentPaddingEnd: CGFloat = 0
    public var debugDescription: String {
        return "Default Cell Size"
    }

    public init() {}
}
