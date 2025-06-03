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
    
    public init(appearance: DividerAppearance? = nil) {
        self._appearance = appearance
    }
    
    public var body: some View {
        GeometryReader { geo in
            appearance.shape
                .path(in: CGRect(x: 0, y: 0, width: geo.size.width, height: appearance.thickness))
        }
        .frame(height: appearance.thickness)
    }
    
    private var appearance: DividerAppearance {
        _appearance ?? environmentAppearance
    }
}
