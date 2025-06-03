import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSSegment` представляет собой компонент для отображения группы связанных опций, где пользователь может выбрать один вариант.

 - Parameters:
    - items: Массив элементов сегмента
    - appearance: Параметры внешнего вида сегмента (опционально)
    - layoutMode: Режим расположения элементов (fixed/flexible)
    - layoutOrientation: Ориентация сегмента (horizontal/vertical)
    - selectedItemId: ID выбранного элемента
    - isDisabled: Флаг отключения сегмента
    - stretch: Флаг растягивания элементов
    - hasBackground: Флаг отображения фона

 ## Окружение
 - `segmentAppearance`: Стандартные настройки внешнего вида сегмента

 ## Примеры использования

 ```swift
 // Горизонтальный сегмент
 SDDSSegment(
     items: [
         SDDSSegmentItemData(
             title: "Title",
             subtitle: "Subtitle",
             iconAttributes: nil,
             isSelected: true,
             appearance: SegmentItem.l.accent.appearance,
             action: {}
         ),
         SDDSSegmentItemData(
             title: "Title",
             subtitle: "Subtitle",
             iconAttributes: nil,
             isSelected: false,
             appearance: SegmentItem.l.accent.appearance,
             action: {}
         )
     ],
     appearance: Segment.l.accent.appearance,
     layoutOrientation: .horizontal,
     selectedItemId: selectedId
 )
 // Вертикальный сегмент
 SDDSSegment(
     items: [
         SDDSSegmentItemData(
             title: "Title",
             subtitle: "Subtitle",
             iconAttributes: nil,
             isSelected: true,
             appearance: SegmentItem.l.accent.appearance,
             action: {}
         ),
         SDDSSegmentItemData(
             title: "Title",
             subtitle: "Subtitle",
             iconAttributes: nil,
             isSelected: false,
             appearance: SegmentItem.l.accent.appearance,
             action: {}
         )
     ],
     appearance: Segment.l.accent.appearance,
     layoutOrientation: .vertical,
     selectedItemId: selectedId
     )
 ```

 */
public struct SDDSSegment: View {
    public let items: [SDDSSegmentItemData<AnyView>]
    private let _appearance: SegmentAppearance?
    public let layoutMode: SegmentLayoutMode
    public let layoutOrientation: SegmentLayoutOrientation
    public let isDisabled: Bool
    public let stretch: Bool
    public let hasBackground: Bool
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.segmentAppearance) private var environmentAppearance
    
    @Binding public var selectedItemId: UUID?

    @State var isAnimating: Bool = false
    @State var isHighlighted: Bool = false
    @State var isHovered: Bool = false
    
    public init(
        items: [SDDSSegmentItemData<AnyView>],
        appearance: SegmentAppearance? = nil,
        layoutMode: SegmentLayoutMode = .flexible,
        layoutOrientation: SegmentLayoutOrientation,
        selectedItemId: Binding<UUID?>,
        isDisabled: Bool = false,
        stretch: Bool = false,
        hasBackground: Bool = true
    ) {
        self.items = items
        self._appearance = appearance
        self.layoutMode = layoutMode
        self.layoutOrientation = layoutOrientation
        self._selectedItemId = selectedItemId
        self.isDisabled = isDisabled
        self.stretch = stretch
        self.hasBackground = hasBackground
    }
    
    public var body: some View {
        Group {
            switch layoutOrientation {
            case .horizontal:
                horizontalOrientation
            case .vertical:
                verticalOrientation
            }
        }
        .padding(appearance.size.paddings)
        .background(backgroundColor)
        .shape(pathDrawer: appearance.size.pathDrawer)
        .disabled(isDisabled)
    }
    
    public var horizontalOrientation: some View {
        HStack(spacing: 0) {
            ForEach(items, id: \.self) { segmentData in
                SDDSSegmentItem(
                    title: segmentData.title,
                    subtitle: segmentData.subtitle,
                    iconAttributes: segmentData.iconAttributes,
                    isDisabled: segmentData.isDisabled,
                    isSelected: selectedItemId == segmentData.id,
                    strech: stretch,
                    counterEnabled: segmentData.counterEnabled,
                    appearance: appearance.segmentItemAppearance,
                    counterText: segmentData.counterText,
                    counter: { segmentData.counter },
                    counterWidthCalculator: segmentData.counterWidthCalculator,
                    action: {
                        selectedItemId = segmentData.id
                    }
                )
            }
        }
        .applyIf(layoutMode == .fixed) {
            $0.frame(height: horizontalHeight)
        }
    }
    
    public var verticalOrientation: some View {
        VStack(spacing: 0) {
            ForEach(items, id: \.self) { segmentData in
                SDDSSegmentItem(
                    title: segmentData.title,
                    subtitle: segmentData.subtitle,
                    iconAttributes: segmentData.iconAttributes,
                    isDisabled: segmentData.isDisabled,
                    isSelected: selectedItemId == segmentData.id,
                    strech: false,
                    counterEnabled: segmentData.counterEnabled,
                    appearance: appearance.segmentItemAppearance,
                    counterText: segmentData.counterText,
                    counter: { segmentData.counter },
                    counterWidthCalculator: segmentData.counterWidthCalculator
                )
                .highPriorityGesture(
                    TapGesture()
                        .onEnded { _ in
                            self.selectedItemId = segmentData.id
                        }
                )
            }
        }
        .applyIf(layoutMode == .fixed) {
            $0.frame(height: verticalWidth)
        }
    }
    
    private var horizontalHeight: CGFloat {
        items.map({ $0.appearance.size.height }).max() ?? 0
    }
    
    private var verticalWidth: CGFloat {
        items.map({ $0.appearance.size.width }).max() ?? 0
    }
    
    private func currentColor(for counterColor: ButtonColor) -> Color {
        if isHighlighted {
            return counterColor.highlightedColor.color(for: colorScheme)
        } else if isHovered {
            return counterColor.hoveredColor.color(for: colorScheme)
        } else {
            return counterColor.defaultColor.color(for: colorScheme)
        }
    }
    
    private var backgroundColor: Color {
        if let backgroundColor = appearance.backgroundColor, hasBackground {
            return currentColor(for: backgroundColor)
        }
        return .clear
    }
    
    var appearance: SegmentAppearance {
        _appearance ?? environmentAppearance
    }
}
