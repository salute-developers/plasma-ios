import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `TooltipAppearance` определяет параметры внешнего вида tooltip.

 - Parameters:
    - backgroundColor: Цвет фона tooltip.
    - textColor: Цвет текста tooltip.
    - contentStartColor: Цвет начального контента (иконки).
    - shadow: Тень tooltip.
    - textTypography: Типографика текста (опционально).
    - size: Конфигурация размеров tooltip.

 ## Пример использования

 ```swift
 TooltipAppearance(
     backgroundColor: .surfaceDefaultSolidCard,
     textColor: .textDefaultPrimary,
     contentStartColor: .iconDefault,
     shadow: .downSoftL,
     textTypography: .default,
     size: DefaultTooltipSize()
 )
 ```
 */
public struct TooltipAppearance: Hashable {
    let id = UUID()
    public var backgroundColor: ColorToken
    public var textColor: ColorToken
    public var contentStartColor: ColorToken
    public var shadow: ShadowToken
    public var textTypography: TypographyConfiguration?
    public var size: TooltipSizeConfiguration
    
    public init(
        backgroundColor: ColorToken = .clearColor,
        textColor: ColorToken = .clearColor,
        contentStartColor: ColorToken = .clearColor,
        shadow: ShadowToken = ShadowToken(),
        textTypography: TypographyConfiguration? = nil,
        size: TooltipSizeConfiguration = ZeroTooltipSize()
    ) {
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.contentStartColor = contentStartColor
        self.shadow = shadow
        self.size = size
        self.textTypography = textTypography
    }
    
    public static func == (lhs: TooltipAppearance, rhs: TooltipAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
} 
