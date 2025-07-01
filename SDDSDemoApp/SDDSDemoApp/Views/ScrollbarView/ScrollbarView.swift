import SwiftUI
import Combine
import SDDSComponents
import SDDSServTheme

struct ScrollbarView: View {
    @ObservedObject private var viewModel: ScrollbarViewModel = ScrollbarViewModel()
    @State var isScrolling = false
    let totalHeight: CGFloat = 130

    var body: some View {
        List {
            Section {
                Text(viewModel.text)
                .padding()
                .scrollbar(
                    scrollBarData: scrollbarData,
                    isScrolling: $isScrolling
                )
            }
            .scrollDisabled(false)
            Section {
                VariationsView(viewModel: viewModel)
                HStack {
                    Toggle(isOn: $viewModel.hasTrack) {
                        Text("Has Track")
                    }
                }
                HStack {
                    Toggle(isOn: $viewModel.hoverExpand) {
                        Text("Hover Expand")
                    }
                }
            }
        }
        .scrollDisabled(true)
        .navigationTitle("Scrollbar")
    }
    
    private var scrollbarData: ScrollBarData {
        .init(
            hasTrack: viewModel.hasTrack,
            hoverExpand: viewModel.hoverExpand,
            applyScrollViewHeight: true,
            offsetY: 0,
            totalHeight: totalHeight,
            scrollBarThickness: viewModel.appearance.size.width,
            scrollBarPaddingTop: 18,
            scrollBarPaddingBottom: 0,
            scrollBarPaddingEnd: 0,
            scrollBarTrackColor: viewModel.appearance.trackColor,
            scrollBarThumbColor: viewModel.appearance.thumbColor,
            contentInsetTop: 0
        )
    }
    
}

#Preview {
    NavigationView {
        ScrollbarView()
    }
} 
