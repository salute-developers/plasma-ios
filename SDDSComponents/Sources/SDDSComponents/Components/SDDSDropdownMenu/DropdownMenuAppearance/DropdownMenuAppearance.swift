import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `DropdownMenuAppearance` представляет собой структуру для настройки внешнего вида выпадающего меню.

 Структура содержит все необходимые параметры для кастомизации внешнего вида dropdown menu,
 включая настройки списка, разделителей, фона и теней.

 - Properties:
    - listAppearance: Настройки внешнего вида списка элементов меню
    - dividerAppearance: Настройки внешнего вида разделителей (опционально)
    - backgroundColor: Цвет фона меню
    - shadow: Тень меню
    - size: Конфигурация размеров меню
 */
public struct DropdownMenuAppearance: Hashable {
    let id = UUID()
    public var listAppearance: ListAppearance
    public var dividerAppearance: DividerAppearance?
    public var backgroundColor: ColorToken
    public var shadow: ShadowToken
    public var size: DropdownMenuSizeConfiguration
    
    public init(
        listAppearance: ListAppearance = .defaultValue,
        dividerAppearance: DividerAppearance? = nil,
        backgroundColor: ColorToken = ColorToken.clearColor,
        shadow: ShadowToken = ShadowToken(),
        size: DropdownMenuSizeConfiguration = ZeroDropdownMenuSize()
    ) {
        self.listAppearance = listAppearance
        self.dividerAppearance = dividerAppearance
        self.backgroundColor = backgroundColor
        self.shadow = shadow
        self.size = size
    }
    
    public static func == (lhs: DropdownMenuAppearance, rhs: DropdownMenuAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.listAppearance == rhs.listAppearance &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension DropdownMenuAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        DropdownMenuAppearance(listAppearance: .defaultValue)
    }
} 
