import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NotificationContentAppearance` определяет внешний вид компонента NotificationContent.
 */
public struct NotificationContentAppearance {
    public var iconColor: ColorToken
    public var titleColor: ColorToken
    public var textColor: ColorToken
    public var titleTypography: TypographyConfiguration
    public var textTypography: TypographyConfiguration
    public var buttonLayout: NotificationContentButtonLayout
    public var iconPlacement: NotificationContentIconPlacement
    public var buttonGroupAppearance: BasicButtonGroupAppearance?
    public var size: NotificationContentSizeConfiguration
    
    public init(
        iconColor: ColorToken = .clearColor,
        titleColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        titleTypography: TypographyConfiguration = .default,
        textTypography: TypographyConfiguration = .default,
        buttonLayout: NotificationContentButtonLayout = .normal,
        iconPlacement: NotificationContentIconPlacement = .start,
        buttonGroupAppearance: BasicButtonGroupAppearance? = nil,
        size: NotificationContentSizeConfiguration = NotificationContentSize()
    ) {
        self.iconColor = iconColor
        self.titleColor = titleColor
        self.textColor = textColor
        self.titleTypography = titleTypography
        self.textTypography = textTypography
        self.buttonLayout = buttonLayout
        self.iconPlacement = iconPlacement
        self.buttonGroupAppearance = buttonGroupAppearance
        self.size = size
    }
}

// MARK: - Environment Key

extension NotificationContentAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        NotificationContentAppearance()
    }
}

public extension EnvironmentValues {
    var notificationContentAppearance: NotificationContentAppearance {
        get { self[NotificationContentAppearance.self] }
        set { self[NotificationContentAppearance.self] = newValue }
    }
}
