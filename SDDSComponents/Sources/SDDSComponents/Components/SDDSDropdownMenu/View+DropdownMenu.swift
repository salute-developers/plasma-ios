import SwiftUI

public extension View {
    /// Модификатор для добавления выпадающего меню к любому SwiftUI View
    /// 
    /// Этот модификатор создает выпадающее меню с кастомным дизайном, используя SDDSPopover под капотом.
    /// Меню автоматически позиционируется относительно триггера и поддерживает настраиваемый внешний вид.
    ///
    /// - Parameters:
    ///   - isPresented: Binding для управления видимостью выпадающего меню
    ///   - appearance: Настройки внешнего вида меню (цвета, тени, размеры)
    ///   - placement: Позиция меню относительно триггера (по умолчанию: .top)
    ///   - alignment: Выравнивание меню относительно триггера (по умолчанию: .start)
    ///   - duration: Время в секундах, через которое меню автоматически скроется (опционально)
    ///   - onClose: Callback, вызываемый при закрытии меню (опционально)
    ///   - content: ViewBuilder для создания контента меню
    ///
    /// - Returns: View с добавленным выпадающим меню
    ///
    /// ## Пример использования:
    /// ```swift
    /// Button("Показать меню") {
    ///     isMenuPresented = true
    /// }
    /// .dropdownMenu(
    ///     isPresented: $isMenuPresented,
    ///     appearance: .default,
    ///     placement: .bottom,
    ///     alignment: .center
    /// ) {
    ///     VStack {
    ///         Text("Пункт 1")
    ///         Text("Пункт 2")
    ///     }
    ///     .padding()
    /// }
    /// ```
    func dropdownMenu<Content: View>(
        isPresented: Binding<Bool>,
        appearance: DropdownMenuAppearance,
        placement: PopoverPlacement = .top,
        alignment: PopoverAlignment = .start,
        placementMode: PopoverPlacementMode = .loose,
        duration: TimeInterval? = nil,
        contentHeight: CGFloat? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.popover(
            isPresented: isPresented,
            appearance: .init(
                backgroundColor: appearance.backgroundColor,
                shadow: appearance.shadow,
                size: popoverSize(from: appearance)
            ),
            placement: placement,
            alignment: alignment,
            tailEnabled: false,
            triggerCentered: true,
            placementMode: placementMode,
            duration: duration,
            contentHeight: contentHeight,
            ignoreTrigger: true,
            onClose: onClose,
            content: content
        )
    }
    
    private func popoverSize(from appearance: DropdownMenuAppearance) -> PopoverSizeConfiguration {
        var size = ZeroPopoverSize()
        size.pathDrawer = appearance.size.shape
        size.width = appearance.size.width
        size.offset = appearance.size.offset
        
        return size
    }
}
