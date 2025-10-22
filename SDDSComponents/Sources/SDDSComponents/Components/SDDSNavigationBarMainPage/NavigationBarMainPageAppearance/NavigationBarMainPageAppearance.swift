import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NavigationBarMainPageAppearance` определяет внешний вид компонента NavigationBarMainPage.
 */
public struct NavigationBarMainPageAppearance {
    // Цвета
    public var actionStartColor: ColorToken
    public var actionEndColor: ColorToken
    public var textColor: ColorToken
    public var backgroundColor: ColorToken
    
    // Типографика
    public var textTypography: TypographyConfiguration
    
    // Тень
    public var shadow: ShadowToken
    
    // Размеры
    public var size: NavigationBarMainPageSizeConfiguration
    
    public init(
        actionStartColor: ColorToken = .clearColor,
        actionEndColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        textTypography: TypographyConfiguration = .default,
        shadow: ShadowToken = ShadowToken(),
        size: NavigationBarMainPageSizeConfiguration = NavigationBarMainPageSize()
    ) {
        self.actionStartColor = actionStartColor
        self.actionEndColor = actionEndColor
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.textTypography = textTypography
        self.shadow = shadow
        self.size = size
    }
}

// MARK: - Environment Key

extension NavigationBarMainPageAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        NavigationBarMainPageAppearance()
    }
}

public extension EnvironmentValues {
    var navigationBarMainPageAppearance: NavigationBarMainPageAppearance {
        get { self[NavigationBarMainPageAppearance.self] }
        set { self[NavigationBarMainPageAppearance.self] = newValue }
    }
}
