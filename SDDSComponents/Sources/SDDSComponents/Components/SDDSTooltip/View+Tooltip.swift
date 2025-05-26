import SwiftUI

public extension View {
    func tooltip<ContentStart: View>(
        isPresented: Binding<Bool>,
        appearance: TooltipAppearance,
        size: TooltipSizeConfiguration = ZeroTooltipSize(),
        text: String,
        placement: PopoverPlacement = .top,
        alignment: PopoverAlignment = .start,
        tailEnabled: Bool = true,
        triggerCentered: Bool = false,
        placementMode: PopoverPlacementMode = .loose,
        duration: TimeInterval? = nil,
        onClose: (() -> Void)? = nil,
        @ViewBuilder contentStart: @escaping () -> ContentStart
    ) -> some View {
        self.popover(
            isPresented: isPresented,
            appearance: PopoverAppearance(
                backgroundColor: appearance.backgroundColor,
                shadow: appearance.shadow,
                size: ZeroPopoverSize()
            ),
            placement: placement,
            alignment: alignment,
            tailEnabled: tailEnabled,
            triggerCentered: triggerCentered,
            placementMode: placementMode,
            duration: duration,
            onClose: onClose
        ) {
            SDDSTooltip(
                appearance: appearance,
                size: size,
                text: text,
                contentStart: contentStart
            )
        }
    }
} 
