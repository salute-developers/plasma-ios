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
        protectContentTaps: Bool = false,
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
                            let protectedFrame = protectedTapFrame(
                                triggerFrame: triggerFrame,
                                placement: placement,
                                alignment: alignment,
                                appearance: appearance,
                                contentHeight: contentHeight,
                                isEnabled: protectContentTaps
                            )
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
                                    protectedTapFrame: protectedFrame,
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
                            let protectedFrame = protectedTapFrame(
                                triggerFrame: triggerFrame,
                                placement: placement,
                                alignment: alignment,
                                appearance: appearance,
                                contentHeight: contentHeight,
                                isEnabled: protectContentTaps
                            )
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
                                protectedTapFrame: protectedFrame,
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
                        let protectedFrame = protectedTapFrame(
                            triggerFrame: triggerFrame,
                            placement: placement,
                            alignment: alignment,
                            appearance: appearance,
                            contentHeight: contentHeight,
                            isEnabled: protectContentTaps
                        )
                        WindowOverlayService.shared.updateContentIfVisible(
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
                            protectedTapFrame: protectedFrame
                        )
                    }
            }
        )
    }
    
    private func protectedTapFrame(
        triggerFrame: CGRect,
        placement: PopoverPlacement,
        alignment: PopoverAlignment,
        appearance: PopoverAppearance,
        contentHeight: CGFloat?,
        isEnabled: Bool
    ) -> CGRect? {
        guard isEnabled, let contentHeight, contentHeight > 0 else { return nil }
        let extraInset = max(abs(appearance.size.offset), appearance.size.tailHeight)
        
        let width = max(triggerFrame.width, appearance.size.width)
        let x: CGFloat
        switch alignment {
        case .start:
            x = triggerFrame.minX
        case .center:
            x = triggerFrame.midX - width / 2
        case .end:
            x = triggerFrame.maxX - width
        }
        
        switch placement {
        case .bottom:
            return CGRect(
                x: x,
                y: triggerFrame.minY,
                width: width,
                height: triggerFrame.height + contentHeight + extraInset
            )
        case .top:
            return CGRect(
                x: x,
                y: triggerFrame.minY - contentHeight - extraInset,
                width: width,
                height: triggerFrame.height + contentHeight + extraInset
            )
        case .start:
            return CGRect(
                x: triggerFrame.minX - width,
                y: triggerFrame.minY,
                width: width + triggerFrame.width,
                height: max(triggerFrame.height, contentHeight)
            )
        case .end:
            return CGRect(
                x: triggerFrame.minX,
                y: triggerFrame.minY,
                width: width + triggerFrame.width,
                height: max(triggerFrame.height, contentHeight)
            )
        }
    }
}
