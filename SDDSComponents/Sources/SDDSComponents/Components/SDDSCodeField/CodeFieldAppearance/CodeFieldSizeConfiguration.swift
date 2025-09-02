import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `CodeFieldSizeConfiguration` определяет размеры и отступы компонента CodeField.
 */
public protocol CodeFieldSizeConfiguration {
    var width: CGFloat { get }
    var height: CGFloat { get }
    var itemSpacing: CGFloat { get }
    var groupSpacing: CGFloat { get }
    var captionSpacing: CGFloat { get }
    var itemShape: PathDrawer { get }
    var groupShape: PathDrawer { get }
    var dotSize: CGFloat { get }
}

/**
 Базовая реализация `CodeFieldSizeConfiguration`.
 */
public struct CodeFieldSize: CodeFieldSizeConfiguration {
    public let width: CGFloat
    public let height: CGFloat
    public let itemSpacing: CGFloat
    public let groupSpacing: CGFloat
    public let captionSpacing: CGFloat
    public let itemShape: PathDrawer
    public let groupShape: PathDrawer
    public let dotSize: CGFloat
    
    public init(
        width: CGFloat = 0,
        height: CGFloat = 0,
        itemSpacing: CGFloat = 0,
        groupSpacing: CGFloat = 0,
        captionSpacing: CGFloat = 0,
        dotSize: CGFloat = 0,
        itemShape: PathDrawer = DefaultPathDrawer(),
        groupShape: PathDrawer = DefaultPathDrawer()
    ) {
        self.width = width
        self.height = height
        self.itemSpacing = itemSpacing
        self.groupSpacing = groupSpacing
        self.captionSpacing = captionSpacing
        self.dotSize = dotSize
        self.itemShape = itemShape
        self.groupShape = groupShape
    }
}
