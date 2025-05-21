import SwiftUI

public extension View {
    func tooltip<ContentStart: View>(
        isPresented: Binding<Bool>,
        appearance: TooltipAppearance,
        width: CGFloat?,
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
        TooltipWithDynamicWidth(
            isPresented: isPresented,
            appearance: appearance,
            initialWidth: width,
            text: text,
            placement: placement,
            alignment: alignment,
            tailEnabled: tailEnabled,
            triggerCentered: triggerCentered,
            placementMode: placementMode,
            duration: duration,
            onClose: onClose,
            contentStart: contentStart,
            trigger: { self }
        )
    }
}

private struct TooltipWithDynamicWidth<ContentStart: View, Trigger: View>: View {
    @Binding var isPresented: Bool
    let appearance: TooltipAppearance
    let initialWidth: CGFloat?
    let text: String
    let placement: PopoverPlacement
    let alignment: PopoverAlignment
    let tailEnabled: Bool
    let triggerCentered: Bool
    let placementMode: PopoverPlacementMode
    let duration: TimeInterval?
    let onClose: (() -> Void)?
    let contentStart: () -> ContentStart
    let trigger: () -> Trigger

    @State private var measuredWidth: CGFloat? = nil
    @State private var triggerWidth: CGFloat? = nil

    var body: some View {
        ZStack {
            SDDSTooltip(
                width: nil,
                appearance: appearance,
                text: text,
                contentStart: contentStart
            )
            .background(
                GeometryReader { geo in
                    Color.clear
                        .onAppear { measuredWidth = geo.size.width }
                        .onChange(of: geo.size) { newSize in measuredWidth = newSize.width }
                }
            )
            .hidden()

            if let tooltipWidth = measuredWidth {
                trigger()
                    .background(
                        GeometryReader { geo in
                            Color.clear
                                .onAppear { triggerWidth = geo.size.width }
                                .onChange(of: geo.size) { newSize in triggerWidth = newSize.width }
                        }
                    )
                    .popover(
                        isPresented: $isPresented,
                        appearance: PopoverAppearance(
                            backgroundColor: appearance.backgroundColor,
                            shadow: appearance.shadow,
                            size: appearance.size.popoverSizeConfiguration(width: tooltipWidth)
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
                            width: tooltipWidth,
                            appearance: appearance,
                            text: text,
                            contentStart: contentStart
                        )
                        .frame(width: tooltipWidth)
                    }
            }
        }
        .frame(width: triggerWidth)
    }
}

private extension TooltipSizeConfiguration {
    func popoverSizeConfiguration(width: CGFloat) -> PopoverSizeConfiguration {
        var result = DefaultPopoverSize()
        result.offset = offset
        result.pathDrawer = pathDrawer
        result.tailHeight = tailHeight
        result.tailWidth = tailWidth
        result.width = width
        result.tailPadding = tailPadding
        return result
    }
}
