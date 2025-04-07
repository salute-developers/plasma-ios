import Foundation
import SwiftUI
import SDDSThemeCore

struct ScrollBarModifier: ViewModifier {
    private let scrollBarData: ScrollBarData
    
    init(scrollBarData: ScrollBarData, isScrollingToBottom: Binding<Bool>) {
        self.scrollBarData = scrollBarData
        _isScrollingToBottom = isScrollingToBottom
    }
    
    @Environment(\.colorScheme) var colorScheme
    @Binding private var isScrollingToBottom: Bool
    @State private var contentHeight: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0
    @State private var offset = CGFloat.zero
    @State private var opacity: CGFloat = 0
    @State private var isScrolling = false
    @State private var lastScrollTime = Date()
    @State private var maxValue: CGFloat = 0
    private var coordinateSpaceName = "scroll"
    private var contentIdentifier = "ScrollBarContentIdentifier"

    func body(content: Content) -> some View{
        ZStack {
            ScrollViewReader { scrollProxy in
                ScrollView(showsIndicators: false) {
                    content
                        .background(
                            GeometryReader { contentGeometry in
                                Color.clear
                                    .onAppear {
                                        contentHeight = contentGeometry.size.height
                                        maxValue = contentHeight - scrollViewHeight
                                    }
                                    .onChange(of: contentGeometry.size.height) { newHeight in
                                        contentHeight = newHeight
                                        maxValue = contentHeight - scrollViewHeight
                                    }
                            }
                        )
                        .background(
                            GeometryReader {
                                Color.clear.preference(
                                    key: ViewOffsetKey.self,
                                    value: -$0.frame(in: .named(coordinateSpaceName)).origin.y
                                )
                            }
                        )
                        .id(contentIdentifier)
                        .onChange(of: isScrollingToBottom) { _ in
                            if isScrollingToBottom {
                                scrollProxy.scrollTo(contentIdentifier, anchor: .bottom)
                            }
                        }
                        .onPreferenceChange(ViewOffsetKey.self) { value in
                            let oldOffset = offset
                            offset = value
                            
                            // Обновляем время последнего скролла
                            lastScrollTime = Date()
                            
                            // Если скролл не был активен, показываем индикатор
                            if !isScrolling {
                                isScrolling = true
                                withAnimation(.easeIn(duration: 0.5)) {
                                    opacity = 1
                                }
                            }
                        }
                }
                .coordinateSpace(name: coordinateSpaceName)
                .onReceive(Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()) { _ in
                    if isScrolling && Date().timeIntervalSince(lastScrollTime) > 3.0 {
                        isScrolling = false
                        withAnimation(.easeOut(duration: 0.5)) {
                            opacity = 0
                        }
                    }
                }
            }
            
            scrollbar
                .offset(y: scrollBarData.scrollBarPaddingTop - scrollBarData.offsetY)
        }
    }
    
    private var scrollbar: some View {
        GeometryReader { geometry in
            let currentScrollViewHeight = geometry.frame(in: .local).height
            
            if contentHeight > currentScrollViewHeight {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 0) {                        
                        ZStack(alignment: .top) {
                            // Track
                            Capsule()
                                .frame(
                                    width: scrollBarData.scrollBarThickness,
                                    height: trackHeight
                                )
                                .foregroundColor(scrollBarData.scrollBarTrackColor.color(for: colorScheme))
                            
                            // Thumb
                            Capsule()
                                .frame(
                                    width: scrollBarData.scrollBarThickness,
                                    height: max(1.0, thumbHeight)
                                )
                                .foregroundColor(scrollBarData.scrollBarThumbColor.color(for: colorScheme))
                                .offset(y: calculatedOffset)
                        }
                        .frame(
                            width: scrollBarData.scrollBarThickness,
                            height: trackHeight
                        )
                        .clipped()
                    }
                    .frame(width: scrollBarData.scrollBarThickness, height: trackHeight)
                    .clipped()
                    //.debug(color: .green, condition: true)
                    .padding(.trailing, scrollBarData.scrollBarPaddingEnd)
                    .onAppear {
                        scrollViewHeight = currentScrollViewHeight
                    }
                    .opacity(opacity)
                }
            }
        }
    }
    
    private var trackHeight: CGFloat {
        var result = scrollBarData.totalHeight - scrollBarData.scrollBarPaddingBottom - scrollBarData.scrollBarPaddingTop
        return result
    }
    
    private var calculatedOffset: CGFloat {
        let scrollOffset = offset
        
        let maxScrollOffset = contentHeight - scrollViewHeight
        
        if maxScrollOffset <= 0 {
            return scrollBarData.scrollBarPaddingTop
        }
        
        let value = min(max(scrollOffset / maxScrollOffset, -1.4), 2.6)
        //print("value: \(value)")
        
        let thumbHeightOffset = thumbHeight// + scrollBarData.scrollBarPaddingTop
        var thumbOffset = value * (trackHeight - thumbHeightOffset)
        //print("maxScrollOffset: \(maxScrollOffset) thumbOffset: \(thumbOffset) trackHeight: \(trackHeight) thumbHeight: \(thumbHeight)")
        
        return thumbOffset
    }
    
    private var thumbHeight: CGFloat {
        let contentLength = max(scrollBarData.totalHeight + contentHeight, 0.001)
        //print("contentLength: \(contentLength)")
        let thumbHeight = ((scrollBarData.totalHeight / contentLength) * scrollBarData.totalHeight)
        let calculatedOffset = offset
        //print("offset: \(calculatedOffset) trackHeight: \(trackHeight) contentHeight: \(contentHeight) scrollHeight: \(scrollBarData.totalHeight)")
        
        return min(thumbHeight, 0.76 * trackHeight)
    }
}

private struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

private struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
