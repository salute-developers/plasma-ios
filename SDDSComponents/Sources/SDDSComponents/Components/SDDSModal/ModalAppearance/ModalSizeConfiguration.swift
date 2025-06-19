import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ModalSizeConfiguration` определяет протокол для конфигурации размеров и отступов модального окна.

 - Properties:
    - closeSize: Размер кнопки закрытия модального окна.
    - paddingStart: Отступ от левого края модального окна.
    - paddingEnd: Отступ от правого края модального окна.
    - paddingTop: Отступ от верхнего края модального окна.
    - paddingBottom: Отступ от нижнего края модального окна.
    - shape: Форма модального окна.
    - shadow: Тень модального окна.
 */
public protocol ModalSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var closeSize: CGFloat { get }
    var paddingStart: CGFloat { get }
    var paddingEnd: CGFloat { get }
    var paddingTop: CGFloat { get }
    var paddingBottom: CGFloat { get }
    var shape: PathDrawer { get }
    var shadow: ShadowToken { get }
}

public struct DefaultModalSize: ModalSizeConfiguration {
    public var closeSize: CGFloat { 24 }
    public var paddingStart: CGFloat { 32 }
    public var paddingEnd: CGFloat { 32 }
    public var paddingTop: CGFloat { 32 }
    public var paddingBottom: CGFloat { 32 }
    public var shape: PathDrawer { DefaultPathDrawer()}
    public var shadow: ShadowToken { ShadowToken() }
    public var debugDescription: String { "DefaultModalSize" }
}

public struct ZeroModalSize: ModalSizeConfiguration {
    public var closeSize: CGFloat { 0 }
    public var paddingStart: CGFloat { 0 }
    public var paddingEnd: CGFloat { 0 }
    public var paddingTop: CGFloat { 0 }
    public var paddingBottom: CGFloat { 0 }
    public var shape: PathDrawer { DefaultPathDrawer() }
    public var shadow: ShadowToken { ShadowToken() }
    public var debugDescription: String { "ZeroModalSize" }
    public init() {}
} 
