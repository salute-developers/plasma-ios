import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `WheelSizeConfiguration` определяет размеры и отступы компонента Wheel.
 */
public protocol WheelSizeConfiguration: CustomDebugStringConvertible {
    var itemTextAfterPadding: CGFloat { get }
    var itemMinSpacing: CGFloat { get }
    var descriptionPadding: CGFloat { get }
    var separatorSpacing: CGFloat { get }
    var itemAlignment: WheelItemAlignment { get }
}

/**
 Базовая реализация `WheelSizeConfiguration`.
 */
public struct WheelSize: WheelSizeConfiguration {
    public let itemTextAfterPadding: CGFloat
    public let itemMinSpacing: CGFloat
    public let descriptionPadding: CGFloat
    public let separatorSpacing: CGFloat
    public let itemAlignment: WheelItemAlignment
    
    public init(
        itemTextAfterPadding: CGFloat = 0,
        itemMinSpacing: CGFloat = 0,
        descriptionPadding: CGFloat = 0,
        separatorSpacing: CGFloat = 0,
        itemAlignment: WheelItemAlignment = .start
    ) {
        self.itemTextAfterPadding = itemTextAfterPadding
        self.itemMinSpacing = itemMinSpacing
        self.descriptionPadding = descriptionPadding
        self.separatorSpacing = separatorSpacing
        self.itemAlignment = itemAlignment
    }
    
    public var debugDescription: String {
        return "WheelSize"
    }
}
