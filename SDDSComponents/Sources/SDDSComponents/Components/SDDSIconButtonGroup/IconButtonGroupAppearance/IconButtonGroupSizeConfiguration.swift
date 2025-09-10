import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `IconButtonGroupSizeConfiguration` определяет размеры и отступы компонента IconButtonGroup.
 */
public protocol IconButtonGroupSizeConfiguration {
    var spacing: CGFloat { get }
    var externalShape: PathDrawer { get }
    var internalShape: PathDrawer { get }
}

/**
 Базовая реализация `IconButtonGroupSizeConfiguration`.
 */
public struct IconButtonGroupSize: IconButtonGroupSizeConfiguration {
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
