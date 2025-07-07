import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSDivider` представляет собой компонент для отображения разделителя, который может быть стилизован с помощью кастомного внешнего вида.

 - Parameters:
    - appearance: Настройки внешнего вида разделителя (опционально). Если не указано, используется значение из окружения.

 ## Окружение

 - `dividerAppearance`: Стандартные настройки внешнего вида разделителя

 ## Пример использования
```swift
    SDDSDivider(appearance: Divider.default.appearance)
```
*/
public struct SDDSDivider: View {
    private let _appearance: DividerAppearance?
    
    @Environment(\.dividerAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    public init(appearance: DividerAppearance? = nil) {
        self._appearance = appearance
    }
    
    public var body: some View {
        appearance.backgroundColor.color(for: colorScheme)
            .frame(height: appearance.thickness)
            .shape(pathDrawer: appearance.shape)
    }
    
    private var appearance: DividerAppearance {
        _appearance ?? environmentAppearance
    }
}
