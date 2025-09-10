import Foundation
import SwiftUI
import SDDSComponents
import SDDSThemeCore

struct NotificationContentSize {
    static let buttonStretch = NotificationContentSizeButtonstretch()
    static let noButtonStretch = NotificationContentSizeNobuttonstretch()

    static let all: [NotificationContentSizeConfiguration] = [
        NotificationContentSize.buttonStretch,
        NotificationContentSize.noButtonStretch,
    ] 
}
struct NotificationContentSizeButtonstretch: NotificationContentSizeConfiguration {
    var buttonGroupStartPadding = CGFloat(0)
    var buttonGroupTopPadding = CGFloat(6.0)
    var contentEndPadding = CGFloat(0)
    var contentStartPadding = CGFloat(4.0)
    var contentTopPadding = CGFloat(2.0)
    var iconMargin = CGFloat(0)
    var iconSize = CGFloat(24.0)
    var textBoxBottomPadding = CGFloat(6.0)
    var textBoxStartPadding = CGFloat(0)
    var textBoxTopPadding = CGFloat(0)
    var textPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "NotificationContentSize"
    }
}
struct NotificationContentSizeNobuttonstretch: NotificationContentSizeConfiguration {
    var buttonGroupStartPadding = CGFloat(0)
    var buttonGroupTopPadding = CGFloat(6.0)
    var contentEndPadding = CGFloat(0)
    var contentStartPadding = CGFloat(0)
    var contentTopPadding = CGFloat(4.0)
    var iconMargin = CGFloat(0)
    var iconSize = CGFloat(24.0)
    var textBoxBottomPadding = CGFloat(6.0)
    var textBoxStartPadding = CGFloat(2.0)
    var textBoxTopPadding = CGFloat(3.0)
    var textPadding = CGFloat(4.0)
    public var debugDescription: String {
        return "NotificationContentSize"
    }
}

struct NotificationContentAnySize: NotificationContentSizeConfiguration {
    var buttonGroupStartPadding = CGFloat(0)
    var buttonGroupTopPadding = CGFloat(0)
    var contentEndPadding = CGFloat(0)
    var contentStartPadding = CGFloat(0)
    var contentTopPadding = CGFloat(0)
    var iconMargin = CGFloat(0)
    var iconSize = CGFloat(0)
    var textBoxBottomPadding = CGFloat(0)
    var textBoxStartPadding = CGFloat(0)
    var textBoxTopPadding = CGFloat(0)
    var textPadding = CGFloat(0)

    init(size: NotificationContentSizeConfiguration) {
        self.buttonGroupStartPadding = size.buttonGroupStartPadding
        self.buttonGroupTopPadding = size.buttonGroupTopPadding
        self.contentEndPadding = size.contentEndPadding
        self.contentStartPadding = size.contentStartPadding
        self.contentTopPadding = size.contentTopPadding
        self.iconMargin = size.iconMargin
        self.iconSize = size.iconSize
        self.textBoxBottomPadding = size.textBoxBottomPadding
        self.textBoxStartPadding = size.textBoxStartPadding
        self.textBoxTopPadding = size.textBoxTopPadding
        self.textPadding = size.textPadding
    }
    var debugDescription: String {
        return "NotificationContentAnySize"
    }
}
