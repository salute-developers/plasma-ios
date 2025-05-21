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
        self.overlay {
            GeometryReader { geometry in
                SDDSPopover(
                    isPresented: isPresented,
                    appearance: appearance,
                    placement: placement,
                    alignment: alignment,
                    tailEnabled: tailEnabled,
                    triggerCentered: triggerCentered,
                    placementMode: placementMode,
                    duration: duration,
                    popoverSizeCalculator: PopoverSizeCalculatorImpl(frame: geometry.frame(in: .global)),
                    onClose: {
                        isPresented.wrappedValue = false
                        onClose?()
                    },
                    content: content
                )
            }
        }
    }
}
