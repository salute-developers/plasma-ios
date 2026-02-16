import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `CollapsingNavigationBarAppearance` определяет внешний вид компонента SDDSCollapsingNavigationBar.
 Кнопка «назад» отображается, когда задан `backIcon`.
 */
public struct CollapsingNavigationBarAppearance {
    // Цвета
    public var backIconColor: ColorToken
    public var actionStartColor: ColorToken
    public var actionEndColor: ColorToken
    public var textColor: ColorToken
    public var titleColor: ColorToken
    public var descriptionColor: ColorToken
    public var backgroundColor: ColorToken

    // Иконка «назад» (если nil — кнопка не показывается)
    public var backIcon: Image?

    // Стиль кнопки действия
    public var actionButtonAppearance: ButtonAppearance?

    // Типографика
    public var textTypography: TypographyConfiguration
    public var titleTypography: TypographyConfiguration
    public var titleTypographyCollapsed: TypographyConfiguration
    public var descriptionTypography: TypographyConfiguration
    public var descriptionTypographyCollapsed: TypographyConfiguration

    // Тень
    public var shadow: ShadowToken

    // Размеры
    public var size: CollapsingNavigationBarSizeConfiguration

    public init(
        backIconColor: ColorToken = .clearColor,
        actionStartColor: ColorToken = .clearColor,
        actionEndColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        titleColor: ColorToken = .clearColor,
        descriptionColor: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        backIcon: Image? = nil,
        actionButtonAppearance: ButtonAppearance? = nil,
        textTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default,
        titleTypographyCollapsed: TypographyConfiguration = .default,
        descriptionTypography: TypographyConfiguration = .default,
        descriptionTypographyCollapsed: TypographyConfiguration = .default,
        shadow: ShadowToken = ShadowToken(),
        size: CollapsingNavigationBarSizeConfiguration = CollapsingNavigationBarSize()
    ) {
        self.backIconColor = backIconColor
        self.actionStartColor = actionStartColor
        self.actionEndColor = actionEndColor
        self.textColor = textColor
        self.titleColor = titleColor
        self.descriptionColor = descriptionColor
        self.backgroundColor = backgroundColor
        self.backIcon = backIcon
        self.actionButtonAppearance = actionButtonAppearance
        self.textTypography = textTypography
        self.titleTypography = titleTypography
        self.titleTypographyCollapsed = titleTypographyCollapsed
        self.descriptionTypography = descriptionTypography
        self.descriptionTypographyCollapsed = descriptionTypographyCollapsed
        self.shadow = shadow
        self.size = size
    }
}

// MARK: - Environment Key

extension CollapsingNavigationBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        CollapsingNavigationBarAppearance()
    }
}

public extension EnvironmentValues {
    var collapsingNavigationBarAppearance: CollapsingNavigationBarAppearance {
        get { self[CollapsingNavigationBarAppearance.self] }
        set { self[CollapsingNavigationBarAppearance.self] = newValue }
    }
}
