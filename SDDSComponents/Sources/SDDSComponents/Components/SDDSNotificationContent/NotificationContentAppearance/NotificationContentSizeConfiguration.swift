import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NotificationContentSizeConfiguration` определяет размеры и отступы компонента NotificationContent.
 */
public protocol NotificationContentSizeConfiguration {
    var iconSize: CGFloat { get }
    var buttonGroupTopPadding: CGFloat { get }
    var textPadding: CGFloat { get }
    var textBoxBottomPadding: CGFloat { get }
    var contentTopPadding: CGFloat { get }
    var contentStartPadding: CGFloat { get }
    var contentEndPadding: CGFloat { get }
    var iconMargin: CGFloat { get }
    var textBoxStartPadding: CGFloat { get }
    var textBoxTopPadding: CGFloat { get }
    var buttonGroupStartPadding: CGFloat { get }
}

/**
 Базовая реализация `NotificationContentSizeConfiguration`.
 */
public struct NotificationContentSize: NotificationContentSizeConfiguration {
    public let iconSize: CGFloat
    public let buttonGroupTopPadding: CGFloat
    public let textPadding: CGFloat
    public let textBoxBottomPadding: CGFloat
    public let contentTopPadding: CGFloat
    public let contentStartPadding: CGFloat
    public let contentEndPadding: CGFloat
    public let iconMargin: CGFloat
    public let textBoxStartPadding: CGFloat
    public let textBoxTopPadding: CGFloat
    public let buttonGroupStartPadding: CGFloat
    
    public init(
        iconSize: CGFloat = 0,
        buttonGroupTopPadding: CGFloat = 0,
        textPadding: CGFloat = 0,
        textBoxBottomPadding: CGFloat = 0,
        contentTopPadding: CGFloat = 0,
        contentStartPadding: CGFloat = 0,
        contentEndPadding: CGFloat = 0,
        iconMargin: CGFloat = 0,
        textBoxStartPadding: CGFloat = 0,
        textBoxTopPadding: CGFloat = 0,
        buttonGroupStartPadding: CGFloat = 0
    ) {
        self.iconSize = iconSize
        self.buttonGroupTopPadding = buttonGroupTopPadding
        self.textPadding = textPadding
        self.textBoxBottomPadding = textBoxBottomPadding
        self.contentTopPadding = contentTopPadding
        self.contentStartPadding = contentStartPadding
        self.contentEndPadding = contentEndPadding
        self.iconMargin = iconMargin
        self.textBoxStartPadding = textBoxStartPadding
        self.textBoxTopPadding = textBoxTopPadding
        self.buttonGroupStartPadding = buttonGroupStartPadding
    }
}
