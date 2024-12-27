import Foundation
@_exported import SDDSThemeCore

/**
 `SwitchSizeConfiguration` определяет конфигурацию размеров для переключателя.
 
 - Properties:
    - width: Ширина переключателя.
    - verticalGap: Вертикальный зазор между элементами.
 */
public protocol SwitchSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var width: CGFloat? { get }
    var verticalGap: CGFloat { get }
}

public struct DefaultSwitchSize: SwitchSizeConfiguration {
    public var width: CGFloat? = nil
    public var verticalGap: CGFloat = 0
    
    public var debugDescription: String {
        return "Default Size"
    }
    
    public init() {}
}
