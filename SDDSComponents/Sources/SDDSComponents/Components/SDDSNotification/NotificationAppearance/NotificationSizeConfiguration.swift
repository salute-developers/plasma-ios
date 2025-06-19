import SwiftUI
@_exported import SDDSThemeCore

/**
 `NotificationSizeConfiguration` определяет протокол для конфигурации размеров и отступов уведомления.

 - Properties:
    - closeSize: Размер кнопки закрытия уведомления.
    - paddingStart: Отступ от левого края уведомления.
    - paddingEnd: Отступ от правого края уведомления.
    - paddingTop: Отступ от верхнего края уведомления.
    - paddingBottom: Отступ от нижнего края уведомления.
    - shape: Форма уведомления.
 */
public protocol NotificationSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var closeSize: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var shape: PathDrawer { get }
} 
