import Foundation
import SwiftUI
import SDDSThemeCore

/**
 `ScrollBarModifier` - модификатор для добавления кастомного скроллбара к ScrollView.
 
 Этот модификатор создает кастомный скроллбар, который:
 - Автоматически появляется при скролле
 - Исчезает через 3 секунды после остановки скролла
 - Адаптируется к размеру контента
 - Поддерживает настройку внешнего вида через ScrollBarData
 */

struct ScrollBarModifier: ViewModifier {
    let scrollBarData: ScrollBarData
    let direction: SDDSScrollDirection
    
    init(scrollBarData: ScrollBarData, direction: SDDSScrollDirection = .vertical, isScrollingToBottom: Binding<Bool>) {
        self.scrollBarData = scrollBarData
        self.direction = direction
        self._isScrollingToBottom = isScrollingToBottom
    }
    
    @Environment(\.colorScheme) var colorScheme
    @Binding private var isScrollingToBottom: Bool
    @State private var contentHeight: CGFloat = 0
    @State private var scrollViewHeight: CGFloat = 0
    @State private var offset: CGFloat = 0
    @State private var percent: CGFloat = 0
    @State private var opacity: Double = 0
    @State private var isScrolling = false
    @State private var lastScrollTime = Date()
    @State private var maxValue: CGFloat = 0
    @State private var isDraggingThumb = false
    @State private var isLongPressed = false
    @State private var isInitialized = false
    @State private var previousOffset = CGFloat.zero
    private var coordinateSpaceName = "scroll"
    private var scrollBarOffsetIdentifier = "scrollBarOffsetIdentifier"
    private var contentIdentifier = "ScrollBarContentIdentifier"

    func body(content: Content) -> some View{
        ZStack {
            ScrollViewReader { scrollProxy in
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer().frame(height: scrollBarData.contentInsetTop)
                        ZStack(alignment: .top) {
                        content
                            Color.clear
                                .frame(height: contentHeight * percent)
                                .id(scrollBarOffsetIdentifier)
                        }
                    }
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
                    .onChange(of: percent) { _ in
                        scrollProxy.scrollTo(scrollBarOffsetIdentifier, anchor: .bottom)
                    }
                    .onPreferenceChange(ViewOffsetKey.self) { value in
                        if !isDraggingThumb {
                            let offsetChanged = abs(value - previousOffset) > 1.0
                            previousOffset = value
                            offset = value
                            lastScrollTime = Date()
                            
                            if !isInitialized {
                                isInitialized = true
                            } else if offsetChanged && !isScrolling {
                                isScrolling = true
                                withAnimation(.easeInOut(duration: SDDSScrollbarConstants.fadeInAnimationDuration)) {
                                    opacity = 1
                                }
                            }
                        }
                    }
                }
                .applyIf(scrollBarData.applyScrollViewHeight) {
                    $0.frame(height: scrollBarData.totalHeight)
                }
                .coordinateSpace(name: coordinateSpaceName)
                .onReceive(Timer.publish(every: SDDSScrollbarConstants.scrollbarOpacityCheckInterval, on: .main, in: .common).autoconnect()) { _ in
                    if isScrolling && !isLongPressed && Date().timeIntervalSince(lastScrollTime) > SDDSScrollbarConstants.scrollbarHideDelay {
                        isScrolling = false
                        withAnimation(.easeInOut(duration: SDDSScrollbarConstants.fadeOutAnimationDuration)) {
                            opacity = 0
                        }
                    }
                }
            }
            scrollbar
                .offset(y: scrollBarData.scrollBarPaddingTop - scrollBarData.offsetY)
                .offset(x: -scrollBarData.scrollBarPaddingEnd)
                .transition(.opacity.combined(with: .scale(scale: SDDSScrollbarConstants.transitionScale)))
                .animation(.easeInOut(duration: SDDSScrollbarConstants.fadeInAnimationDuration), value: opacity > 0)
        }
    }
    
    private var scrollbar: some View {
        GeometryReader { geometry in
            let currentScrollViewHeight = geometry.frame(in: .local).height
            let currentScrollViewWidth = geometry.frame(in: .local).width
            if contentHeight > (direction == .vertical ? currentScrollViewHeight : currentScrollViewWidth) && (isScrolling || isLongPressed || isDraggingThumb) {
                HStack {
                    if direction == .vertical {
                        Spacer()
                    }
                    SDDSScrollbar(
                        appearance: createScrollbarAppearance(),
                        hasTrack: scrollBarData.hasTrack,
                        hoverExpand: scrollBarData.hoverExpand,
                        thumbOffset: calculatedOffset,
                        thumbHeight: max(1.0, thumbHeight),
                        trackHeight: trackHeight,
                        scrollBarPaddingBottom: scrollBarData.scrollBarPaddingBottom,
                        scrollBarPaddingTop: scrollBarData.scrollBarPaddingTop,
                        direction: direction,
                        onThumbDrag: { percent in
                            isDraggingThumb = true
                            lastScrollTime = Date()
                            let maxScrollOffset = contentHeight - (direction == .vertical ? currentScrollViewHeight : currentScrollViewWidth)
                            let newOffset = percent * max(1, maxScrollOffset)
                            offset = newOffset
                            self.percent = percent
                            DispatchQueue.main.async {
                                isDraggingThumb = false
                                lastScrollTime = Date()
                            }
                        },
                        onLongPressChanged: { isPressed in
                            isLongPressed = isPressed
                            if isPressed {
                                withAnimation(.easeInOut(duration: SDDSScrollbarConstants.fadeInAnimationDuration)) {
                                    opacity = 1
                                }
                            }
                        }
                    )
                    .onAppear {
                        scrollViewHeight = currentScrollViewHeight
                    }

                    if direction == .horizontal {
                        Spacer()
                    }
                }
            }
        }
    }
    
    private func createScrollbarAppearance() -> ScrollbarAppearance {
        var appearance = ScrollbarAppearance()
        appearance.thumbColor = scrollBarData.scrollBarThumbColor
        appearance.trackColor = scrollBarData.scrollBarTrackColor
        let customSize = CustomScrollbarSize(width: scrollBarData.scrollBarThickness)
        appearance.size = customSize
        return appearance
    }
    
    private var calculatedOffset: CGFloat {
        let scrollOffset = offset
        
        let maxScrollOffset = contentHeight - scrollViewHeight
        
        if maxScrollOffset <= 0 {
            return scrollBarData.scrollBarPaddingTop
        }
        
        let value = min(max(scrollOffset / maxScrollOffset, -1.4), 2.6)
        
        let thumbHeightOffset = thumbHeight
        let thumbOffset = value * (trackHeight - thumbHeightOffset)
        
        return thumbOffset
    }
    
    private var trackHeight: CGFloat {
        var result = scrollBarData.totalHeight - scrollBarData.scrollBarPaddingBottom - scrollBarData.scrollBarPaddingTop
        return result
    }

    private var thumbHeight: CGFloat {
        let contentLength = max(scrollBarData.totalHeight + contentHeight, 0.001)
        let thumbHeight = ((scrollBarData.totalHeight / contentLength) * scrollBarData.totalHeight)
        return min(thumbHeight, SDDSScrollbarConstants.thumbHeightMultiplier * trackHeight)
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

private struct CustomScrollbarSize: ScrollbarSizeConfiguration {
    let width: CGFloat
    let hoverExpandFactor: CGFloat = 2.0
    
    init(width: CGFloat) {
        self.width = width
    }
    
    var shape: PathDrawer {
        CircleDrawer()
    }
}

private struct SDDSScrollbarConstants {
    static let fadeInAnimationDuration: TimeInterval = 0.3
    static let fadeOutAnimationDuration: TimeInterval = 0.3
    static let scrollbarHideDelay: TimeInterval = 3.0
    static let scrollbarOpacityCheckInterval: TimeInterval = 0.1
    static let thumbHeightMultiplier: CGFloat = 0.76
    static let transitionScale: CGFloat = 0.95
}
