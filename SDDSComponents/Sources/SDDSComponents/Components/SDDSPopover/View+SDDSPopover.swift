import SwiftUI

public struct PopoverAnchorPreferenceKey: PreferenceKey {
    public static var defaultValue: CGRect = .zero
    public static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

public extension View {
    func popoverWithTail<Content: View>(
        isPresented: Binding<Bool>,
        appearance: PopoverAppearance,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self.background(
            PopoverAnchorView(isPresented: isPresented, appearance: appearance, content: content, anchor: self)
        )
    }
}

private struct PopoverAnchorView<Anchor: View, Content: View>: View {
    @Binding var isPresented: Bool
    let appearance: PopoverAppearance
    let content: () -> Content
    let anchor: Anchor
    @State private var anchorFrame: CGRect = .zero
    @State private var popoverPosition: PopoverTailPosition = .top
    
    var body: some View {
        ZStack {
            anchor
                .background(
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: PopoverAnchorPreferenceKey.self, value: proxy.frame(in: .global))
                    }
                )
            if isPresented {
                GeometryReader { proxy in
                    let screen = proxy.frame(in: .global)
                    let popoverSize = CGSize(width: appearance.size.width, height: 100 + appearance.size.tailHeight) // TODO: вычислять высоту контента
                    let anchorRect = anchorFrame
                    let position = bestPopoverPosition(screen: screen, anchor: anchorRect, popover: popoverSize)
                    SDDSPopover(appearance: appearance, tailPosition: position) {
                        content()
                    }
                    .position(popoverOrigin(for: position, anchor: anchorRect, popover: popoverSize))
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
        .onPreferenceChange(PopoverAnchorPreferenceKey.self) { value in
            anchorFrame = value
        }
    }
    
    private func bestPopoverPosition(screen: CGRect, anchor: CGRect, popover: CGSize) -> PopoverTailPosition {
        // Проверяем top, right, bottom, left по часовой стрелке
        let positions: [PopoverTailPosition] = [.top, .right, .bottom, .left]
        for pos in positions {
            let origin = popoverOrigin(for: pos, anchor: anchor, popover: popover)
            let popoverRect = CGRect(origin: origin, size: popover)
            if screen.contains(popoverRect) {
                return pos
            }
        }
        return .top
    }
    
    private func popoverOrigin(for position: PopoverTailPosition, anchor: CGRect, popover: CGSize) -> CGPoint {
        switch position {
        case .top:
            return CGPoint(x: anchor.midX, y: anchor.minY - popover.height / 2)
        case .bottom:
            return CGPoint(x: anchor.midX, y: anchor.maxY + popover.height / 2)
        case .left:
            return CGPoint(x: anchor.minX - popover.width / 2, y: anchor.midY)
        case .right:
            return CGPoint(x: anchor.maxX + popover.width / 2, y: anchor.midY)
        }
    }
} 