import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `CodeInputSizeConfiguration` определяет размеры и отступы компонента CodeInput.
 */
public protocol CodeInputSizeConfiguration {
    var itemHeight: CGFloat { get }
    var itemWidth: CGFloat { get }
    var dotSize: CGFloat { get }
    var strokeWidth: CGFloat { get }
    var itemSpacing: CGFloat { get }
    var groupSpacing: CGFloat { get }
    var captionPadding: CGFloat { get }
}

/**
 Базовая реализация `CodeInputSizeConfiguration`.
 */
public struct CodeInputSize: CodeInputSizeConfiguration {
    public let itemHeight: CGFloat
    public let itemWidth: CGFloat
    public let dotSize: CGFloat
    public let strokeWidth: CGFloat
    public let itemSpacing: CGFloat
    public let groupSpacing: CGFloat
    public let captionPadding: CGFloat
    
    public init(
        itemHeight: CGFloat = 0,
        itemWidth: CGFloat = 0,
        dotSize: CGFloat = 0,
        strokeWidth: CGFloat = 0,
        itemSpacing: CGFloat = 0,
        groupSpacing: CGFloat = 0,
        captionPadding: CGFloat = 0
    ) {
        self.itemHeight = itemHeight
        self.itemWidth = itemWidth
        self.dotSize = dotSize
        self.strokeWidth = strokeWidth
        self.itemSpacing = itemSpacing
        self.groupSpacing = groupSpacing
        self.captionPadding = captionPadding
    }
}
