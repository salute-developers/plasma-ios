import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ChipAppearance` определяет внешний вид чипа, включая цвета и типографику.
 
 - Properties:
    - size: Конфигурация размеров для чипа.
    - titleColor: Цвет текста заголовка.
    - titleTypography: Типографика заголовка.
    - imageTintColor: Цвет Image.
    - buttonTintColor: Цвет Button.
    - backgroundColor: Цвет чипа.
    - disabledAlpha: Прозрачность чипа в выключенном состоянии.
 */
public struct ChipAppearance: Hashable {
    let id = UUID()
    public var size: ChipSizeConfiguration
    public var titleColor: ButtonColor
    public var titleTypography: TypographyConfiguration
    public var imageTintColor: ButtonColor
    public var buttonTintColor: ButtonColor
    public var backgroundColor: ButtonColor
    public var disabledAlpha: CGFloat

    public init(
        size: ChipSizeConfiguration = ZeroChipSize(),
        titleColor: ButtonColor = ButtonColor(),
        titleTypography: TypographyConfiguration = .default,
        imageTintColor: ButtonColor = ButtonColor(),
        buttonTintColor: ButtonColor = ButtonColor(),
        backgroundColor: ButtonColor = ButtonColor(),
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.titleColor = titleColor
        self.titleTypography = titleTypography
        self.imageTintColor = imageTintColor
        self.buttonTintColor = buttonTintColor
        self.backgroundColor = backgroundColor
        self.disabledAlpha = disabledAlpha
    }
    
    public static func == (lhs: ChipAppearance, rhs: ChipAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.titleColor == rhs.titleColor &&
        lhs.imageTintColor == rhs.imageTintColor &&
        lhs.buttonTintColor == rhs.buttonTintColor &&
        lhs.backgroundColor == rhs.backgroundColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(titleColor)
        hasher.combine(imageTintColor)
        hasher.combine(buttonTintColor)
        hasher.combine(backgroundColor)
    }
}

extension ChipAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ChipAppearance.self, fallback: ChipAppearance())
    }
}
