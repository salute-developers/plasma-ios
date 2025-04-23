import Foundation
@_exported import SDDSThemeCore

/**
 `SwitchSizeConfiguration` определяет конфигурацию размеров для переключателя.
 
 - Properties:
    - width: Ширина переключателя.
    - verticalGap: Вертикальный зазор между элементами.
 */
public protocol SwitchSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var toggleTrackPathDrawer: PathDrawer { get }
    var toggleThumbPathDrawer: PathDrawer { get }
    var toggleTrackWidth: CGFloat { get }
    var toggleTrackHeight: CGFloat { get }
    var toggleThumbWidth: CGFloat { get }
    var toggleThumbHeight: CGFloat { get }
    var toggleThumbPadding: CGFloat { get }
    var descriptionPadding: CGFloat { get }
    var textPadding: CGFloat { get }
    
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    var width: CGFloat? { get }
    @available(*, deprecated, message: "Don't use it, public method will be removed")
    var verticalGap: CGFloat { get }
}

public struct DefaultSwitchSize: SwitchSizeConfiguration {
    public var toggleTrackPathDrawer: any SDDSThemeCore.PathDrawer { CircleDrawer() }
    public var toggleThumbPathDrawer: any SDDSThemeCore.PathDrawer { CircleDrawer() }
    public var toggleTrackWidth: CGFloat { 44 }
    public var toggleTrackHeight: CGFloat { 28 }
    public var toggleThumbWidth: CGFloat { 24 }
    public var toggleThumbHeight: CGFloat { 24 }
    public var descriptionPadding: CGFloat { 0 }
    public var toggleThumbPadding: CGFloat { 0 }
    public var textPadding: CGFloat { 0 }
    public var width: CGFloat? = nil
    public var verticalGap: CGFloat = 0
    
    public var debugDescription: String {
        return "Default Size"
    }
    
    public init() {}
}
