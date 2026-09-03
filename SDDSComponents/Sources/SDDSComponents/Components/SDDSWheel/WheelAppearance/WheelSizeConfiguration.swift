import Foundation
import SwiftUI
import SDDSApiInfo
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
    @ApiType(.iconSize)
    @ApiName("controlIconUp")
    var controlIconUpSize: CGFloat { get }
    @ApiType(.iconSize)
    @ApiName("controlIconDown")
    var controlIconDownSize: CGFloat { get }
    var selectionIndicatorEnabled: Bool { get }
    var selectionIndicatorShape: CGFloat { get }
    var selectionIndicatorPaddingTop: CGFloat { get }
    var selectionIndicatorPaddingBottom: CGFloat { get }
    var selectionIndicatorPaddingStart: CGFloat { get }
    var selectionIndicatorPaddingEnd: CGFloat { get }
}

public extension WheelSizeConfiguration {
    var selectionIndicatorEnabled: Bool { false }
    var selectionIndicatorShape: CGFloat { 0 }
    var selectionIndicatorPaddingTop: CGFloat { 0 }
    var selectionIndicatorPaddingBottom: CGFloat { 0 }
    var selectionIndicatorPaddingStart: CGFloat { 0 }
    var selectionIndicatorPaddingEnd: CGFloat { 0 }
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
    public let controlIconUpSize: CGFloat
    public let controlIconDownSize: CGFloat
    public let selectionIndicatorEnabled: Bool
    public let selectionIndicatorShape: CGFloat
    public let selectionIndicatorPaddingTop: CGFloat
    public let selectionIndicatorPaddingBottom: CGFloat
    public let selectionIndicatorPaddingStart: CGFloat
    public let selectionIndicatorPaddingEnd: CGFloat

    public init(
        itemTextAfterPadding: CGFloat = 0,
        itemMinSpacing: CGFloat = 0,
        descriptionPadding: CGFloat = 0,
        separatorSpacing: CGFloat = 0,
        itemAlignment: WheelItemAlignment = .start,
        controlIconUpSize: CGFloat = 0,
        controlIconDownSize: CGFloat = 0,
        selectionIndicatorEnabled: Bool = false,
        selectionIndicatorShape: CGFloat = 0,
        selectionIndicatorPaddingTop: CGFloat = 0,
        selectionIndicatorPaddingBottom: CGFloat = 0,
        selectionIndicatorPaddingStart: CGFloat = 0,
        selectionIndicatorPaddingEnd: CGFloat = 0
    ) {
        self.itemTextAfterPadding = itemTextAfterPadding
        self.itemMinSpacing = itemMinSpacing
        self.descriptionPadding = descriptionPadding
        self.separatorSpacing = separatorSpacing
        self.itemAlignment = itemAlignment
        self.controlIconUpSize = controlIconUpSize
        self.controlIconDownSize = controlIconDownSize
        self.selectionIndicatorEnabled = selectionIndicatorEnabled
        self.selectionIndicatorShape = selectionIndicatorShape
        self.selectionIndicatorPaddingTop = selectionIndicatorPaddingTop
        self.selectionIndicatorPaddingBottom = selectionIndicatorPaddingBottom
        self.selectionIndicatorPaddingStart = selectionIndicatorPaddingStart
        self.selectionIndicatorPaddingEnd = selectionIndicatorPaddingEnd
    }

    public var debugDescription: String {
        return "WheelSize"
    }
}
