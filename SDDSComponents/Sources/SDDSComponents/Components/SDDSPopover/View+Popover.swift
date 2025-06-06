import Foundation
import SwiftUI

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
