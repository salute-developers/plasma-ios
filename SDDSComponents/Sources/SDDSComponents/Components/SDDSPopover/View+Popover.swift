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
        onClose: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.background(
            GeometryReader { geometry in
                Color.clear
                    .task(id: isPresented.wrappedValue) {
                        let triggerFrame = geometry.frame(in: .global)
                        if isPresented.wrappedValue {
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
                                        onClose: {
                                            isPresented.wrappedValue = false
                                            WindowOverlayService.shared.hide()
                                            onClose?()
                                        },
                                        content: content
                                    )
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
        )
    }
}
