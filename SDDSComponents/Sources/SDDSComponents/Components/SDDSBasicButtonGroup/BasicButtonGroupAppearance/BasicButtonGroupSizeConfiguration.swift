import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `BasicButtonGroupSizeConfiguration` определяет размеры и отступы компонента BasicButtonGroup.
 */
public protocol BasicButtonGroupSizeConfiguration {
    var spacing: CGFloat { get }
    var externalShape: PathDrawer { get }
    var internalShape: PathDrawer { get }
}

/**
 Базовая реализация `BasicButtonGroupSizeConfiguration`.
 */
public struct BasicButtonGroupSize: BasicButtonGroupSizeConfiguration {
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
