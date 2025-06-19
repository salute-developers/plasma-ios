import SwiftUI
@_exported import SDDSThemeCore

/**
 `NotificationAppearance` определяет параметры внешнего вида уведомления.

 - Parameters:
    - backgroundColor: Цвет фона уведомления.
    - closeColor: Цвет кнопки закрытия уведомления.
    - size: Конфигурация размеров и отступов уведомления.
 
 ```swift
 NotificationAppearance(
     backgroundColor: .surfaceDefaultSolidCard,
     closeColor: .textDefaultSecondary,
     size: NotificationSize.default
 )
 ```
 */
public struct NotificationAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var closeColor: ColorToken
    public var size: NotificationSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        closeColor: ColorToken = .clearColor,
        size: NotificationSizeConfiguration = ZeroNotificationSize()
    ) {
        self.backgroundColor = backgroundColor
        self.closeColor = closeColor
        self.size = size
    }
    
    public static func == (lhs: NotificationAppearance, rhs: NotificationAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

extension NotificationAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: NotificationAppearance.self, fallback: NotificationAppearance())
    }
} 
