import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `CollapsingNavigationBarAppearance` определяет внешний вид компонента SDDSCollapsingNavigationBar.
 Кнопка «назад» отображается, когда задан `backIcon`.
 */
@ApiInfo(components: ["CollapsingNavigationBarInternalPage", "CollapsingNavigationBarMainPage"])
public struct CollapsingNavigationBarAppearance {
    // Цвета
    public var backIconColor: StatefulFillStyle
    public var actionStartColor: StatefulFillStyle
    public var actionEndColor: StatefulFillStyle
    public var textColor: StatefulFillStyle
    public var titleColor: StatefulFillStyle
    public var descriptionColor: StatefulFillStyle
    public var backgroundColor: StatefulFillStyle

    // Иконка «назад» (если nil — кнопка не показывается)
    public var backIcon: Image?

    // Стиль кнопки действия
    @ApiName("actionButtonStyle")
    public var actionButtonAppearance: ButtonAppearance?

    // Типографика
    @ApiName("textStyle")
    public var textTypography: TypographyConfiguration
    @ApiName("titleStyle")
    public var titleTypography: TypographyConfiguration
    @ApiName("titleStyle", state: .collapsed)
    public var titleTypographyCollapsed: TypographyConfiguration
    public var titleStatefulTypography: StatefulValue<TypographyConfiguration>
    @ApiName("descriptionStyle")
    public var descriptionTypography: TypographyConfiguration
    @ApiName("descriptionStyle", state: .collapsed)
    public var descriptionTypographyCollapsed: TypographyConfiguration
    public var descriptionStatefulTypography: StatefulValue<TypographyConfiguration>

    // Тень
    public var shadow: ShadowToken

    // Размеры
    public var size: CollapsingNavigationBarSizeConfiguration

    public init(
        backIconColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        actionStartColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        actionEndColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        textColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        titleColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        descriptionColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: []),
        backIcon: Image? = nil,
        actionButtonAppearance: ButtonAppearance? = nil,
        textTypography: TypographyConfiguration = .default,
        titleTypography: TypographyConfiguration = .default,
        titleTypographyCollapsed: TypographyConfiguration = .default,
        titleStatefulTypography: StatefulValue<TypographyConfiguration>? = nil,
        descriptionTypography: TypographyConfiguration = .default,
        descriptionTypographyCollapsed: TypographyConfiguration = .default,
        descriptionStatefulTypography: StatefulValue<TypographyConfiguration>? = nil,
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
        self.titleStatefulTypography = titleStatefulTypography ?? StatefulValue(
            defaultValue: titleTypography,
            values: [
                .init(states: [InteractiveState.collapsed], value: titleTypographyCollapsed)
            ]
        )
        self.descriptionTypography = descriptionTypography
        self.descriptionTypographyCollapsed = descriptionTypographyCollapsed
        self.descriptionStatefulTypography = descriptionStatefulTypography ?? StatefulValue(
            defaultValue: descriptionTypography,
            values: [
                .init(states: [InteractiveState.collapsed], value: descriptionTypographyCollapsed)
            ]
        )
        self.shadow = shadow
        self.size = size
    }

    @available(*, deprecated, message: "ColorToken is deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
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
        titleStatefulTypography: StatefulValue<TypographyConfiguration>? = nil,
        descriptionTypography: TypographyConfiguration = .default,
        descriptionTypographyCollapsed: TypographyConfiguration = .default,
        descriptionStatefulTypography: StatefulValue<TypographyConfiguration>? = nil,
        shadow: ShadowToken = ShadowToken(),
        size: CollapsingNavigationBarSizeConfiguration = CollapsingNavigationBarSize()
    ) {
        self.init(
            backIconColor: backIconColor.fill,
            actionStartColor: actionStartColor.fill,
            actionEndColor: actionEndColor.fill,
            textColor: textColor.fill,
            titleColor: titleColor.fill,
            descriptionColor: descriptionColor.fill,
            backgroundColor: backgroundColor.fill,
            backIcon: backIcon,
            actionButtonAppearance: actionButtonAppearance,
            textTypography: textTypography,
            titleTypography: titleTypography,
            titleTypographyCollapsed: titleTypographyCollapsed,
            titleStatefulTypography: titleStatefulTypography,
            descriptionTypography: descriptionTypography,
            descriptionTypographyCollapsed: descriptionTypographyCollapsed,
            descriptionStatefulTypography: descriptionStatefulTypography,
            shadow: shadow,
            size: size
        )
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
