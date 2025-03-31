import SwiftUI

struct ScrollbarModifier: ViewModifier {
    @Binding var scrollbarData: ScrollbarData
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    let appearance: TextAreaAppearance
    let hasTrack: Bool
    let alignment: Alignment
    let paddings: EdgeInsets
    
    func body(content: Content) -> some View {
        ZStack(alignment: alignment) {
            content
            if !allContentInTextEditorIsVisible {
                Scrollbar(
                    hasTrack: hasTrack,
                    thumbLength: scrollbarData.calculateThumbLength(),
                    trackThickness: appearance.size.scrollBarThickness,
                    thumbOffsetY: scrollbarData.thumbOffset(),
                    trackColor: appearance.scrollBarTrackColor.color(for: colorScheme),
                    thumbColor: appearance.scrollBarThumbColor.color(for: colorScheme)
                )
                .frame(width: appearance.size.scrollBarThickness)
                .padding(paddings)
                .opacity(scrollbarData.scrollEnded ? 0 : 1)
                .animation(.easeInOut, value: scrollbarData.scrollEnded)
            }
        }
    }
    
    var allContentInTextEditorIsVisible: Bool {
        scrollbarData.contentHeight == scrollbarData.visibleHeight
    }
}

public extension View {
    func scrollbar(hasTrack: Bool, appearance: TextAreaAppearance, data: Binding<ScrollbarData>, alignment: Alignment, paddings: EdgeInsets) -> some View {
        self.modifier(
            ScrollbarModifier(
                scrollbarData: data,
                appearance: appearance,
                hasTrack: hasTrack,
                alignment: alignment,
                paddings: paddings
            )
        )
    }
}
