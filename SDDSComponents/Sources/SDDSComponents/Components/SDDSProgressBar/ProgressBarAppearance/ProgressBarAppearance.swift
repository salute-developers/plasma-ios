import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `ProgressBarAppearance` определяет внешний вид прогресс-бара, включая цвет индикатора и фона.
 
 - Properties:
    - size: Конфигурация размеров для прогресс-бара.
    - tintColor: Цвет индикатора прогресса.
    - trackColor: Цвет фона прогресс-бара.
 */
public struct ProgressBarAppearance: Hashable {
    let id = UUID()
    public let size: ProgressBarSizeConfiguration
    public let tintFillStyle: FillStyle
    public let trackColor: ColorToken
    
    public init(size: ProgressBarSizeConfiguration = ZeroProgressBarSize(), tintFillStyle: FillStyle = .color(.clearColor), trackColor: ColorToken = .clearColor) {
        self.size = size
        self.tintFillStyle = tintFillStyle
        self.trackColor = trackColor
    }
    
    public static func == (lhs: ProgressBarAppearance, rhs: ProgressBarAppearance) -> Bool {
        lhs.id == rhs.id &&
        lhs.tintFillStyle == rhs.tintFillStyle &&
        lhs.trackColor == rhs.trackColor
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(tintFillStyle)
        hasher.combine(trackColor)
    }
}

extension ProgressBarAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: ProgressBarAppearance.self, fallback: ProgressBarAppearance())
    }
}
