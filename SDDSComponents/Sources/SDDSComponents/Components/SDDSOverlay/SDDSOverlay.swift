import SwiftUI

/**
 `SDDSOverlay` представляет собой компонент для отображения оверлея с настраиваемым содержимым и внешним видом, который появляется поверх основного интерфейса при условии активации.

 - Parameters:
    - isPresented: Привязка к булевому значению, определяющему, отображается ли оверлей. По умолчанию `false`.
    - appearance: Опциональные параметры внешнего вида оверлея (`OverlayAppearance`). Если не переданы, используются значения из окружения.
    - content: Замыкание, возвращающее содержимое оверлея, реализующее протокол `View`.

 ## Окружение
 - `overlayAppearance`: Стандартные настройки внешнего вида оверлея, используемые при отсутствии явного указания параметра `appearance`.

 ## Пример использования
```swift
@State var isPresent: Bool = true
 
MyView()
    .overlay(isPresent: $isPresent, appearance: Overlay.default.appearance)
```
*/
public struct SDDSOverlay<Content: View>: View {
    @Binding public var isPresented: Bool
    private let _appearance: OverlayAppearance?
    private let content: () -> Content
    
    @Environment(\.overlayAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    
    public init(
        isPresented: Binding<Bool> = .constant(false),
        appearance: OverlayAppearance? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isPresented = isPresented
        self._appearance = appearance
        self.content = content
    }
    
    public var body: some View {
        if isPresented {
            content()
                .blur(radius: appearance.blurRadius)
                .overlay {
                    Color.clear
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(appearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                }
                .allowsHitTesting(appearance.blurRadius == 0 ? true : false)
        } else {
            content()
        }
    }
    
    private var appearance: OverlayAppearance {
        _appearance ?? environmentAppearance
    }
}
