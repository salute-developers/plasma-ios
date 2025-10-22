import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `NavigationBarInternalPageAppearance` определяет внешний вид компонента NavigationBarInternalPage.
 */
public struct NavigationBarInternalPageAppearance {
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
    public var size: NavigationBarInternalPageSizeConfiguration
    
    public init(
        backIconColor: ColorToken = .clearColor,
        actionStartColor: ColorToken = .clearColor,
        actionEndColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        backgroundColor: ColorToken = .clearColor,
        backIcon: Image? = nil,
        textTypography: TypographyConfiguration = .default,
        shadow: ShadowToken = ShadowToken(),
        size: NavigationBarInternalPageSizeConfiguration = NavigationBarInternalPageSize()
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

extension NavigationBarInternalPageAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        NavigationBarInternalPageAppearance()
    }
}

public extension EnvironmentValues {
    var navigationBarInternalPageAppearance: NavigationBarInternalPageAppearance {
        get { self[NavigationBarInternalPageAppearance.self] }
        set { self[NavigationBarInternalPageAppearance.self] = newValue }
    }
}
