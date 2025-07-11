import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `SDDSScrollbar` представляет собой компонент для отображения кастомного скроллбара.
 
 Компонент отображает трек и ползунок скроллбара с настраиваемыми параметрами внешнего вида.
 Поддерживает различные размеры, цвета и формы в соответствии с дизайн-системой.
 
 ## Особенности
 - При наведении курсора (hover) скроллбар увеличивается в ширине согласно `appearance.size.hoverExpandFactor`
 - При долгом нажатии (0.5 сек) скроллбар увеличивается в ширине в 2 раза (как в Safari)
 - Поддерживает drag gesture для перетаскивания ползунка с мгновенной реакцией
 - Плавные анимации появления/исчезновения и изменения размера
 - Синхронизация с внешним скроллом контента

 - Parameters:
    - appearance: Параметры внешнего вида скроллбара (опционально)
    - hasTrack: Флаг отображения трека скроллбара
    - thumbOffset: Смещение ползунка скроллбара относительно трека
    - thumbHeight: Высота ползунка скроллбара
    - totalHeight: Общая высота области скроллбара
    - scrollBarPaddingBottom: Отступ снизу для скроллбара
    - scrollBarPaddingTop: Отступ сверху для скроллбара
    - onThumbDrag: Callback для обработки перетаскивания ползунка (передает процент скролла 0.0-1.0)
    - onLongPressChanged: Callback для обработки изменения состояния long press

 ## Окружение
 - `scrollbarAppearance`: Стандартные настройки внешнего вида скроллбара

 ## Примеры использования
 ```swift
 // Базовый скроллбар с треком и обработчиками
 SDDSScrollbar(
     appearance: Scrollbar.m.appearance,
     hasTrack: true,
     thumbOffset: 50,
     thumbHeight: 40,
     totalHeight: 200,
     scrollBarPaddingBottom: 10,
     scrollBarPaddingTop: 10,
     onThumbDrag: { percentage in
         // Обработка перетаскивания ползунка
         print("Scroll percentage: \(percentage)")
     },
     onLongPressChanged: { isLongPressed in
         // Обработка long press
         print("Long pressed: \(isLongPressed)")
     }
 )
 
 // Скроллбар без трека (только ползунок)
 SDDSScrollbar(
     appearance: Scrollbar.s.appearance,
     hasTrack: false,
     thumbOffset: 30,
     thumbHeight: 30,
     totalHeight: 150,
     scrollBarPaddingBottom: 5,
     scrollBarPaddingTop: 5
 )
 ```
 */

public enum SDDSScrollDirection {
    case vertical
    case horizontal
}

public struct SDDSScrollbar: View {
    @Environment(\.scrollbarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let _appearance: ScrollbarAppearance?
    private let hasTrack: Bool
    private let hoverExpand: Bool
    private let thumbOffset: CGFloat
    private let thumbHeight: CGFloat
    private let trackHeight: CGFloat
    private let scrollBarPaddingBottom: CGFloat
    private let scrollBarPaddingTop: CGFloat
    private let onThumbDrag: ((CGFloat) -> Void)?
    private let onLongPressChanged: ((Bool) -> Void)?
    private let direction: SDDSScrollDirection
    
    @State private var isLongPressed = false
    @State private var longPressTimer: Timer?
    @State private var dragStartOffset: CGFloat = 0
    @State private var isDragging: Bool = false
    @State private var isHovered: Bool = false
    
    public init(
        appearance: ScrollbarAppearance? = nil,
        hasTrack: Bool = true,
        hoverExpand: Bool = true,
        thumbOffset: CGFloat,
        thumbHeight: CGFloat,
        trackHeight: CGFloat,
        scrollBarPaddingBottom: CGFloat,
        scrollBarPaddingTop: CGFloat,
        direction: SDDSScrollDirection = .vertical,
        onThumbDrag: ((CGFloat) -> Void)? = nil,
        onLongPressChanged: ((Bool) -> Void)? = nil
    ) {
        self._appearance = appearance
        self.hasTrack = hasTrack
        self.hoverExpand = hoverExpand
        self.thumbOffset = thumbOffset
        self.thumbHeight = thumbHeight
        self.trackHeight = trackHeight
        self.scrollBarPaddingTop = scrollBarPaddingTop
        self.scrollBarPaddingBottom = scrollBarPaddingBottom
        self.direction = direction
        self.onThumbDrag = onThumbDrag
        self.onLongPressChanged = onLongPressChanged
    }
    
    public var body: some View {
        ZStack(alignment: direction == .vertical ? .top : .leading) {
            Rectangle()
                .frame(
                    width: direction == .vertical ? currentWidth : trackLength,
                    height: direction == .vertical ? trackHeight : currentWidth
                )
                .shape(pathDrawer: appearance.size.shape)
                .foregroundColor(appearance.trackColor.color(for: colorScheme))
                .hiddenIf(!hasTrack)
            
            Rectangle()
                .frame(
                    width: direction == .vertical ? currentWidth : max(1.0, thumbHeight),
                    height: direction == .vertical ? max(1.0, thumbHeight) : currentWidth
                )
                .shape(pathDrawer: appearance.size.shape)
                .foregroundColor(appearance.thumbColor.color(for: colorScheme))
                .offset(x: direction == .horizontal ? thumbOffset : 0,
                        y: direction == .vertical ? thumbOffset : 0)
                .onLongPressGesture(
                    minimumDuration: SDDSScrollbarConstants.longPressDuration,
                    maximumDistance: SDDSScrollbarConstants.longPressMaximumDistance,
                    perform: {},
                    onPressingChanged: { isPressing in
                        handleLongPress(isPressing: isPressing)
                    }
                )
                .simultaneousGesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            guard isLongPressed else {
                                return
                            }
                            if !isDragging {
                                isDragging = true
                                dragStartOffset = thumbOffset
                            }
                            let translation = direction == .vertical ? value.translation.height : value.translation.width
                            let dragOffset = dragStartOffset + translation
                            let maxOffset = (direction == .vertical ? trackHeight : trackLength) - thumbHeight
                            let newThumbOffset = max(0, min(maxOffset, dragOffset))
                            let scrollPercentage = maxOffset > 0 ? newThumbOffset / maxOffset : 0.0
                            onThumbDrag?(scrollPercentage)
                        }
                        .onEnded { _ in
                            guard isLongPressed else {
                                return
                            }
                            isDragging = false
                            dragStartOffset = thumbOffset
                        }
                )
                .onAppear {
                    dragStartOffset = thumbOffset
                }
                .onChange(of: thumbOffset) { newOffset in
                    if !isDragging {
                        dragStartOffset = newOffset
                    }
                }
        }
        .frame(
            width: direction == .vertical ? currentWidth : trackLength,
            height: direction == .vertical ? trackHeight : currentWidth
        )
        .shape(pathDrawer: appearance.size.shape)
        .clipped()
        .onHover { hovering in
            withAnimation(.easeInOut(duration: SDDSScrollbarConstants.longPressAnimationDuration)) {
                isHovered = hovering
            }
        }
        .animation(.easeInOut(duration: SDDSScrollbarConstants.longPressAnimationDuration), value: isLongPressed)
        .animation(isDragging ? nil : .easeInOut(duration: SDDSScrollbarConstants.thumbAnimationDuration), value: thumbOffset)
        .animation(.easeInOut(duration: SDDSScrollbarConstants.longPressAnimationDuration), value: isHovered)
        .offset(x: direction == .vertical ? horizontalOffset : 0,
                y: direction == .horizontal ? horizontalOffset : 0)
    }
    
    private var trackLength: CGFloat {
        direction == .vertical ? currentWidth : trackHeight
    }
    
    private var currentWidth: CGFloat {
        let baseWidth = appearance.size.width
        var finalWidth = baseWidth
        
        guard hoverExpand else {
            return finalWidth
        }
        
        if isHovered {
            finalWidth *= appearance.size.hoverExpandFactor
        }
        
        if isLongPressed {
            finalWidth *= SDDSScrollbarConstants.longPressScaleMultiplier
        }
        
        return finalWidth
    }
    
    private var horizontalOffset: CGFloat {
        return (hoverExpand && isLongPressed) ? currentWidth * SDDSScrollbarConstants.longPressHorizontalOffsetMultiplier : 0
    }
    
    private func handleLongPress(isPressing: Bool) {
        if isPressing {
            longPressTimer = Timer.scheduledTimer(withTimeInterval: SDDSScrollbarConstants.longPressDuration, repeats: false) { _ in
                withAnimation(.easeInOut(duration: SDDSScrollbarConstants.longPressAnimationDuration)) {
                    isLongPressed = true
                }
                onLongPressChanged?(true)
            }
        } else {
            longPressTimer?.invalidate()
            longPressTimer = nil
            withAnimation(.easeInOut(duration: SDDSScrollbarConstants.longPressAnimationDuration)) {
                isLongPressed = false
            }
            onLongPressChanged?(false)
        }
    }
    
    var appearance: ScrollbarAppearance {
        _appearance ?? environmentAppearance
    }
}

private struct SDDSScrollbarConstants {
    static let longPressDuration: TimeInterval = 0.5
    static let longPressMaximumDistance: CGFloat = 50
    static let longPressAnimationDuration: TimeInterval = 0.2
    static let thumbAnimationDuration: TimeInterval = 0.1
    static let longPressScaleMultiplier: CGFloat = 2.0
    static let longPressHorizontalOffsetMultiplier: CGFloat = 0.25
    static let thumbHeightMultiplier: CGFloat = 0.76
}
