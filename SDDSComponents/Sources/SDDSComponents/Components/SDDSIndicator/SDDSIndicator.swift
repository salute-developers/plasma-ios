import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSIndicator` представляет собой компонент для отображения индикатора, который может использоваться для обозначения обязательных полей или других важных элементов интерфейса.

 - Parameters:
    - appearance: Параметры внешнего вида индикатора (опционально)

 ## Окружение
 - `indicatorAppearance`: Стандартные настройки внешнего вида индикатора

 ## Примеры использования
 ```swift
 // Базовый индикатор
 SDDSIndicator(
     appearance: Indicator.m.accent.appearance
 )
 ```
 */

public struct SDDSIndicator: View {
    @Environment(\.indicatorAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    private let _appearance: IndicatorAppearance?
    
    public init(appearance: IndicatorAppearance? = nil) {
        self._appearance = appearance
    }
    
    public var body: some View {
        appearance.size
            .pathDrawer
            .path(in: CGRect(x: 0, y: 0, width: width, height: height))
            .fill(appearance.backgroundColor.color(for: colorScheme))
            .frame(width: width, height: height)
    }
    
    private var width: CGFloat {
        appearance.size.width
    }
    
    private var height: CGFloat {
        appearance.size.height
    }
    
    var appearance: IndicatorAppearance {
        _appearance ?? environmentAppearance
    }
}
