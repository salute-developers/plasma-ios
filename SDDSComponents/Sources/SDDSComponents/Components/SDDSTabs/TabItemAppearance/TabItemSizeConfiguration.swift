import Foundation
import SwiftUI

/**
 Протокол `TabItemSizeConfiguration` определяет размеры и отступы элемента вкладки.
 
 - Properties:
    - disableAlpha: Прозрачность в неактивном состоянии
    - minHeight: Минимальная высота элемента
    - startContentSize: Размер контента в начале
    - endContentSize: Размер контента в конце
    - startContentPadding: Отступ контента в начале
    - valuePadding: Отступ значения
    - counterPadding: Отступ счетчика
    - actionPadding: Отступ действия
    - paddingStart: Отступ слева
    - paddingEnd: Отступ справа
    - iconPadding: Отступ иконки
    - actionSize: Размер действия
    - actionIconSize: Размер иконки действия
    - counterOffsetX: Смещение счетчика по X
    - counterOffsetY: Смещение счетчика по Y
 */
public protocol TabItemSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var disableAlpha: CGFloat { get }
    var minHeight: CGFloat { get }
    var startContentSize: CGFloat { get }
    var endContentSize: CGFloat { get }
    var startContentPadding: CGFloat { get }
    var valuePadding: CGFloat { get }
    var counterPadding: CGFloat { get }
    var actionPadding: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var iconPadding: CGFloat { get }
    var actionSize: CGFloat { get }
    var actionIconSize: CGFloat { get }
    var counterOffsetX: CGFloat { get }
    var counterOffsetY: CGFloat { get }
}

public struct ZeroTabItemSize: TabItemSizeConfiguration {
    public var disableAlpha: CGFloat = 0
    public var minHeight: CGFloat = 0
    public var startContentSize: CGFloat = 0
    public var endContentSize: CGFloat = 0
    public var startContentPadding: CGFloat = 0
    public var valuePadding: CGFloat = 0
    public var counterPadding: CGFloat = 0
    public var actionPadding: CGFloat = 0
    public var paddingStart: CGFloat = 0
    public var paddingEnd: CGFloat = 0
    public var iconPadding: CGFloat = 0
    public var actionSize: CGFloat = 0
    public var actionIconSize: CGFloat = 0
    public var counterOffsetX: CGFloat = 0
    public var counterOffsetY: CGFloat = 0
    
    public var debugDescription: String {
        return "Zero TabItem Size"
    }
    
    public init() {}
}
