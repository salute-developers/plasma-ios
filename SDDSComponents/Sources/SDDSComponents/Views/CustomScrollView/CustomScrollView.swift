import SwiftUI

public struct CustomScrollView<Content: View>: View {
    var content: Content
    public var scrollbarData: Binding<ScrollbarData>
    
    init(
        scrollbarData: Binding<ScrollbarData>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.scrollbarData = scrollbarData
        self.content = content()
    }
    
    public var body: some View {
        ScrollViewWrapper(
            contentOffset: Binding(
                get: { scrollbarData.wrappedValue.contentOffset },
                set: { newValue in scrollbarData.wrappedValue.contentOffset = newValue }
            ),
            scrollViewHeight: Binding(
                get: { scrollbarData.wrappedValue.contentHeight },
                set: { newValue in scrollbarData.wrappedValue.contentHeight = newValue }
            ),
            visibleHeight: Binding(
                get: { scrollbarData.wrappedValue.visibleHeight },
                set: { newValue in scrollbarData.wrappedValue.visibleHeight = newValue }
            )
        ) {
            content
        }
    }
}
