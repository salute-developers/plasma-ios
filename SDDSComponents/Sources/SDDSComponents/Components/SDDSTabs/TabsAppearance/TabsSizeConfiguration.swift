import Foundation
import SwiftUI

/**
 Протокол `TabsSizeConfiguration` определяет размеры и параметры контейнера вкладок.
 
 - Properties:
    - dividerEnabled: Включен ли разделитель
    - indicatorEnabled: Включен ли индикатор
    - indicatorThickness: Толщина индикатора
    - minSpacing: Минимальное расстояние между элементами
    - orientation: Ориентация вкладок
    - overflowIconSize: Размер иконок кнопок навигации
 */
public protocol TabsSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var dividerEnabled: Bool { get }
    var indicatorEnabled: Bool { get }
    var indicatorThickness: CGFloat { get }
    var minSpacing: CGFloat { get }
    var orientation: TabsOrientation { get }
    var overflowIconSize: CGFloat { get }
    var disclosureIconSize: CGFloat { get }
}

public struct ZeroTabsSize: TabsSizeConfiguration {
    public var dividerEnabled: Bool = true
    public var indicatorEnabled: Bool = true
    public var indicatorThickness: CGFloat = 0
    public var minSpacing: CGFloat = 0
    public var orientation: TabsOrientation = .horizontal
    public var overflowIconSize: CGFloat = 0
    public var disclosureIconSize: CGFloat = 0
    
    public var debugDescription: String {
        return "Zero Tabs Size"
    }
    
    public init() {}
}
