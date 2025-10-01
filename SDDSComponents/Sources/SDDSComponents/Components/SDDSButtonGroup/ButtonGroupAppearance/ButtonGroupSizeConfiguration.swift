import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ButtonGroupSizeConfiguration` определяет размеры и отступы компонента ButtonGroup.
 */
public protocol ButtonGroupSizeConfiguration {
    var spacing: CGFloat { get }
    var externalShape: PathDrawer { get }
    var internalShape: PathDrawer { get }
}

/**
 Базовая реализация `ButtonGroupSizeConfiguration`.
 */
public struct ButtonGroupSize: ButtonGroupSizeConfiguration {
    public let spacing: CGFloat
    public let externalShape: PathDrawer
    public let internalShape: PathDrawer
    
    public init(
        spacing: CGFloat = 0,
        externalShape: PathDrawer = DefaultPathDrawer(),
        internalShape: PathDrawer = DefaultPathDrawer()
    ) {
        self.spacing = spacing
        self.externalShape = externalShape
        self.internalShape = internalShape
    }
}
