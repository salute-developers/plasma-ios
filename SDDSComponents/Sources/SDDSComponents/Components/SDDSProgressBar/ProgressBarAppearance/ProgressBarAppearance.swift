import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ProgressBarAppearance` определяет внешний вид прогресс-бара, включая цвет индикатора и фона.
 
 - Properties:
    - size: Конфигурация размеров для прогресс-бара.
    - tintColor: Цвет индикатора прогресса.
    - trackColor: Цвет фона прогресс-бара.
 */
// sdds:apiInfo
public struct ProgressBarAppearance: Hashable {
    let id = UUID()
    public var size: ProgressBarSizeConfiguration
    // sdds:apiName=indicatorColor
    public var tintFillStyle: FillStyle
    // sdds:apiName=backgroundColor
    public var trackColor: ColorToken
    public var disabledAlpha: CGFloat
    
    public init(
        size: ProgressBarSizeConfiguration = ZeroProgressBarSize(),
        tintFillStyle: FillStyle = .color(.clearColor),
        trackColor: ColorToken = .clearColor,
        disabledAlpha: CGFloat = 0
    ) {
        self.size = size
        self.tintFillStyle = tintFillStyle
        self.trackColor = trackColor
        self.disabledAlpha = disabledAlpha
    }
    
    public static func == (lhs: ProgressBarAppearance, rhs: ProgressBarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.tintFillStyle == rhs.tintFillStyle &&
        lhs.trackColor == rhs.trackColor &&
        lhs.disabledAlpha == rhs.disabledAlpha
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(tintFillStyle)
        hasher.combine(trackColor)
        hasher.combine(disabledAlpha)
    }
}

extension ProgressBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ProgressBarAppearance.self, fallback: ProgressBarAppearance())
    }
}
