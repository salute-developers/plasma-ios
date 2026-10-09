import Foundation
import SwiftUI
import SDDSApiInfo
@_exported import SDDSThemeCore

/**
 `NavigationBarAppearance` определяет внешний вид компонента NavigationBar.

 Внешний вид общий для обоих типов панели: `backIcon` и `backIconColor` использует
 только внутренняя страница, у главной кнопки «назад» нет.
 */
@ApiInfo
public struct NavigationBarAppearance {
    // Цвета
    public var backIconColor: ColorToken
    public var actionStartColor: ColorToken
    public var actionEndColor: ColorToken
    public var textColor: ColorToken
    public var backgroundColor: ColorToken

    // Иконка
    public var backIcon: Image?

    // Типографика
    public var textTypography: TypographyConfiguration

    // Тень
    public var shadow: ShadowToken

    // Размеры
    public var size: NavigationBarSizeConfiguration

    public init(
        backIconColor: ColorToken = .clearColor,
        actionStartColor: ColorToken = .clearColor,
        actionEndColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        backIcon: Image? = nil,
        textTypography: TypographyConfiguration = .default,
        shadow: ShadowToken = ShadowToken(),
        size: NavigationBarSizeConfiguration = NavigationBarSize()
    ) {
        self.backIconColor = backIconColor
        self.actionStartColor = actionStartColor
        self.actionEndColor = actionEndColor
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.backIcon = backIcon
        self.textTypography = textTypography
        self.shadow = shadow
        self.size = size
    }
}

// MARK: - Environment Key

extension NavigationBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        NavigationBarAppearance()
    }
}

public extension EnvironmentValues {
    var navigationBarAppearance: NavigationBarAppearance {
        get { self[NavigationBarAppearance.self] }
        set { self[NavigationBarAppearance.self] = newValue }
    }
}
