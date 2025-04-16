import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ProgressBarSizeConfiguration` определяет конфигурацию размеров для прогресс-бара.
 
 - Properties:
 - height: Высота прогресс-бара.
 - indicatorHeight: Высота индикатора прогресса.
 - cornerRadius: Радиус скругления углов прогресс-бара.
 - indicatorCornerRadius: Радиус скругления углов индикатора прогресса.
 */
public protocol ProgressBarSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var indicatorHeight: CGFloat { get }
    var indicatorPathDrawer: PathDrawer { get }
    var pathDrawer: PathDrawer { get }
    @available(*, deprecated, message: "use 'pathDrawer' instead")
    var cornerRadius: CGFloat { get }
    var indicatorCornerRadius: CGFloat { get }
}

public struct ZeroProgressBarSize: ProgressBarSizeConfiguration {
    public var debugDescription: String { "ZeroProgressBarSize" }
    public var height: CGFloat = 0
    public var indicatorHeight: CGFloat = 0
    public var indicatorPathDrawer: PathDrawer = DefaultPathDrawer()
    public var pathDrawer: PathDrawer = DefaultPathDrawer()
    public var cornerRadius: CGFloat = 0
    public var indicatorCornerRadius: CGFloat = 0
    public init() {}
}
