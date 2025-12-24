import Foundation
import SwiftUI

/**
 Модификатор для отображения всплывающих подсказок (popover) с возможностью настройки внешнего вида, положения и хвоста.

 - Parameters:
    - isPresented: Состояние отображения popover.
    - appearance: Параметры внешнего вида popover.
    - placement: Положение popover относительно якоря (по умолчанию `.top`).
    - alignment: Выравнивание popover относительно якоря (по умолчанию `.start`).
    - tailEnabled: Показывать ли хвост popover (по умолчанию true).
    - triggerCentered: Центрировать ли popover относительно якоря (по умолчанию false).
    - placementMode: Режим размещения popover (по умолчанию `.loose`).
    - duration: Время отображения popover в секундах (по умолчанию nil - не исчезает автоматически).
    - onClose: Обработчик закрытия popover.
    - content: View-контент popover.

 ```swift
 Text("Показать popover")
     .popover(
         isPresented: $isPopoverPresented,
         appearance: Popover.default.appearance,
         placement: .bottom,
         alignment: .start,
         tailEnabled: true
     ) {
         Text("Контент popover")
     }
 ```
 */
public extension View {
    func popover<Content: View>(
        isPresented: Binding<Bool>,
        appearance: PopoverAppearance,
        placement: PopoverPlacement = .top,
        alignment: PopoverAlignment = .start,
        tailEnabled: Bool = true,
        triggerCentered: Bool = false,
        placementMode: PopoverPlacementMode = .loose,
        duration: TimeInterval? = nil,
        contentHeight: CGFloat? = nil,
        subtheme: SubthemeData = SubthemeData(),
        ignoreTrigger: Bool = false,
        contentId: AnyHashable? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.background(
            GeometryReader { geometry in
                Color.clear
                    .onChange(of: isPresented.wrappedValue) { newValue in
                        // Используем асинхронное обновление, чтобы не вызывать перерисовку родительского view
                        Task { @MainActor in
                            let triggerFrame = geometry.frame(in: .global)
                            if newValue {
                                WindowOverlayService.shared.show(
                                    content: {
                                        SDDSPopover(
                                            isPresented: isPresented,
                                            appearance: appearance,
                                            placement: placement,
                                            alignment: alignment,
                                            tailEnabled: tailEnabled,
                                            triggerCentered: triggerCentered,
                                            placementMode: placementMode,
                                            duration: duration,
                                            popoverSizeCalculator: PopoverSizeCalculatorImpl(frame: triggerFrame),
                                            contentHeight: contentHeight,
                                            ignoreTrigger: ignoreTrigger,
                                            onClose: {
                                                isPresented.wrappedValue = false
                                                WindowOverlayService.shared.hide()
                                                onClose?()
                                            },
                                            content: content
                                        )
                                        .environment(\.subtheme, subtheme)
                                    },
                                    at: triggerFrame,
                                    onClose: {
                                        isPresented.wrappedValue = false
                                        onClose?()
                                    }
                                )
                            } else {
                                WindowOverlayService.shared.hide()
                            }
                        }
                    }
                    .onAppear {
                        // Предварительно инициализируем при появлении view
                        // Это предотвратит перерисовку при первом изменении isPresented
                        if isPresented.wrappedValue {
                            let triggerFrame = geometry.frame(in: .global)
                            WindowOverlayService.shared.show(
                                content: {
                                    SDDSPopover(
                                        isPresented: isPresented,
                                        appearance: appearance,
                                        placement: placement,
                                        alignment: alignment,
                                        tailEnabled: tailEnabled,
                                        triggerCentered: triggerCentered,
                                        placementMode: placementMode,
                                        duration: duration,
                                        popoverSizeCalculator: PopoverSizeCalculatorImpl(frame: triggerFrame),
                                        contentHeight: contentHeight,
                                        ignoreTrigger: ignoreTrigger,
                                        onClose: {
                                            isPresented.wrappedValue = false
                                            WindowOverlayService.shared.hide()
                                            onClose?()
                                        },
                                        content: content
                                    )
                                    .environment(\.subtheme, subtheme)
                                },
                                at: triggerFrame,
                                onClose: {
                                    isPresented.wrappedValue = false
                                    onClose?()
                                }
                            )
                        }
                    }
                    // Периодически обновляем контент, если popover показан
                    // Это позволяет обновлять контент даже когда isPresented остается true
                    // Используем contentId для отслеживания изменений контента
                    .task(id: contentId.map { "\($0)-\(isPresented.wrappedValue)" } ?? "\(isPresented.wrappedValue)") {
                        guard isPresented.wrappedValue else { return }
                        // Используем небольшой delay, чтобы дать время для обновления контента
                        try? await Task.sleep(nanoseconds: 50_000_000) // 50ms
                        let triggerFrame = geometry.frame(in: .global)
                        WindowOverlayService.shared.updateContentIfVisible {
                            SDDSPopover(
                                isPresented: isPresented,
                                appearance: appearance,
                                placement: placement,
                                alignment: alignment,
                                tailEnabled: tailEnabled,
                                triggerCentered: triggerCentered,
                                placementMode: placementMode,
                                duration: duration,
                                popoverSizeCalculator: PopoverSizeCalculatorImpl(frame: triggerFrame),
                                contentHeight: contentHeight,
                                ignoreTrigger: ignoreTrigger,
                                onClose: {
                                    isPresented.wrappedValue = false
                                    WindowOverlayService.shared.hide()
                                    onClose?()
                                },
                                content: content
                            )
                            .environment(\.subtheme, subtheme)
                        }
                    }
            }
        )
    }
}
