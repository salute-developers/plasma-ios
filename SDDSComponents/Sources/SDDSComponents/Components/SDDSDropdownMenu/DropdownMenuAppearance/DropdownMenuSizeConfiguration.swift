import Foundation
import SwiftUI

/**
 `DropdownMenuSizeConfiguration` определяет протокол для конфигурации размеров выпадающего меню.

 Протокол определяет все необходимые параметры размеров и отступов для dropdown menu,
 включая смещение, форму и ширину.

 - Properties:
    - offset: Смещение меню относительно триггера
    - shape: Форма меню (скругления углов)
    - width: Ширина меню
 */
public protocol DropdownMenuSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var offset: CGFloat { get }
    var shape: PathDrawer { get }
    var width: CGFloat { get }
}

/**
 Стандартная конфигурация размеров для dropdown menu.

 Предоставляет стандартные значения для всех параметров размеров dropdown menu.
 */
public struct DefaultDropdownMenuSize: DropdownMenuSizeConfiguration {
    public var offset: CGFloat = 8
    public var shape: PathDrawer = CornerRadiusDrawer(cornerRadius: 12)
    public var width: CGFloat = 200
    
    public var debugDescription: String {
        "DefaultDropdownMenuSize"
    }
}

/**
 Конфигурация размеров с нулевыми значениями для dropdown menu.

 Используется как значение по умолчанию для создания пустых конфигураций.
 */
public struct ZeroDropdownMenuSize: DropdownMenuSizeConfiguration {
    public var offset: CGFloat { 0 }
    public var shape: PathDrawer { DefaultPathDrawer() }
    public var width: CGFloat { 0 }
    
    public var debugDescription: String {
        "ZeroDropdownMenuSize"
    }
    
    public init() {}
} 
