import SwiftUI

//public struct CustomScrollView<Content: View>: View {
//    var content: Content
//    public var scrollViewMetrics: Binding<ScrollViewMetrics>
//    
//    init(
//        scrollViewMetrics: Binding<ScrollViewMetrics>,
//        @ViewBuilder content: @escaping () -> Content
//    ) {
//        self.scrollViewMetrics = scrollViewMetrics
//        self.content = content()
//    }
//    
//    public var body: some View {
//            ScrollViewWrapper(
//                contentOffset: Binding(
//                    get: { scrollViewMetrics.wrappedValue.contentOffset },
//                    set: { newValue in scrollViewMetrics.wrappedValue.contentOffset = newValue }
//                ),
//                scrollViewHeight: Binding(
//                    get: { scrollViewMetrics.wrappedValue.contentHeight },
//                    set: { newValue in scrollViewMetrics.wrappedValue.contentHeight = newValue }
//                ),
//                visibleHeight: Binding(
//                    get: { scrollViewMetrics.wrappedValue.visibleHeight },
//                    set: { newValue in scrollViewMetrics.wrappedValue.visibleHeight = newValue }
//                )
//            ) {
//                content
//                let _ = print("body of CustomScrollView")
//            }
//        .debug(color: Color.blue, condition: true)
//    }
//}
