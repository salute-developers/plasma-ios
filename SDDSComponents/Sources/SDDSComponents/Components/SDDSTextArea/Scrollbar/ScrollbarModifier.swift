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
                    if isScrolling && Date().timeIntervalSince(lastScrollTime) > 0.3 {
                        isScrolling = false
                        withAnimation(.easeOut(duration: 0.5)) {
                            opacity = 0
                        }
                    }
                }
            }
            
            scrollbar
        }
        .clipped()
    }
    
    private var scrollbar: some View {
        GeometryReader { geometry in
            let currentScrollViewHeight = geometry.frame(in: .local).height
            
            if contentHeight > currentScrollViewHeight {
                HStack {
                    Spacer()
                    
                    VStack(spacing: 0) {
                        Spacer(minLength: scrollBarData.scrollBarPaddingTop)
                        
                        ZStack(alignment: .top) {
                            // Track
                            Capsule()
                                .frame(
                                    width: scrollBarData.scrollBarThickness,
                                    height: max(1.0, currentScrollViewHeight - scrollBarData.scrollBarPaddingTop - scrollBarData.scrollBarPaddingBottom)
                                )
                                .foregroundColor(scrollBarData.scrollBarTrackColor.color(for: colorScheme))
                            
                            // Thumb
                            Capsule()
                                .frame(
                                    width: scrollBarData.scrollBarThickness,
                                    height: max(1.0, thumbHeight(currentScrollViewHeight: currentScrollViewHeight))
                                )
                                .foregroundColor(scrollBarData.scrollBarThumbColor.color(for: colorScheme))
                                .offset(y: offset * (currentScrollViewHeight / contentHeight))
                        }
                        
                        Spacer(minLength: scrollBarData.scrollBarPaddingBottom)
                    }
                    .frame(width: scrollBarData.scrollBarThickness)
                    .padding(.trailing, scrollBarData.scrollBarPaddingEnd)
                    .onAppear {
                        scrollViewHeight = currentScrollViewHeight
                    }
                    .opacity(opacity)
                }
            }
        }
    }
    
    private func thumbHeight(currentScrollViewHeight: CGFloat) -> CGFloat {
        let contentLength = max(
            currentScrollViewHeight + maxValue,
            0.001 // Не допускаем деление на 0
        )
        let thumbHeight = ((currentScrollViewHeight / contentLength) * currentScrollViewHeight)
        return thumbHeight
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
