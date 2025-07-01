import Foundation
import SwiftUI
import SDDSThemeCore

/**
 Протокол для конфигурации размеров скроллбара.
 */
public protocol ScrollbarSizeConfiguration {
    var width: CGFloat { get }
    var hoverExpandFactor: CGFloat { get }
    var shape: PathDrawer { get }
}

/**
 Конфигурация размеров по умолчанию для скроллбара.
 */
public struct DefaultScrollbarSize: ScrollbarSizeConfiguration {
    public let width: CGFloat = 2.0
    public let hoverExpandFactor: CGFloat = 2.0
    
    public var shape: any PathDrawer {
        CircleDrawer()
    }
    
    public init() {}
}
