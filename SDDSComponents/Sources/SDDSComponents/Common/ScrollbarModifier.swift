import SwiftUI

struct ScrollbarModifier: ViewModifier {
    @Binding var scrollbarData: ScrollbarData
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    
    let appearance: TextAreaAppearance
    let hasTrack: Bool
    
    func body(content: Content) -> some View {
        ZStack(alignment: .trailing) {
            content
            if !allContentInTextEditorIsVisible {
                SDDSScrollbar(
                    hasTrack: hasTrack,
                    thumbLength: scrollbarData.calculateThumbLength(),
                    trackThickness: appearance.size.scrollBarThickness,
                    thumbOffsetY: scrollbarData.thumbOffset(),
                    trackColor: appearance.scrollBarTrackColor.color(for: colorScheme),
                    thumbColor: appearance.scrollBarThumbColor.color(for: colorScheme)
                )
                .frame(width: appearance.size.scrollBarThickness)
                .padding(.trailing, appearance.size.scrollBarPaddings.trailing)
//                .opacity(scrollbarData.scrollEnded ? 0 : 1)
//                .animation(.easeInOut, value: scrollbarData.scrollEnded)
            }
        }
        .debug(color: Color.orange, condition: true)
    }
    
    var allContentInTextEditorIsVisible: Bool {
        scrollbarData.contentHeight == scrollbarData.visibleHeight
    }
}

public enum TypeOfView {
    case customView
    case scrollView
}

public extension View {
    func scrollbar(hasTrack: Bool, appearance: TextAreaAppearance, data: Binding<ScrollbarData>) -> some View {
        self
        .modifier(
            ScrollbarModifier(
                scrollbarData: data,
                appearance: appearance,
                hasTrack: hasTrack
            )
        )
    }
}
