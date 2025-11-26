import SwiftUI
import Foundation

/// Контейнер вкладок с поддержкой различных режимов отображения
///
/// Поддерживает horizontal и vertical ориентации, различные режимы clipMode,
/// автоматический скролл и анимированный индикатор.
public struct SDDSTabs: View {
    @Environment(\.tabsAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @State private var contentWidth: CGFloat = 0
    @State private var contentHeight: CGFloat = 0
    @State private var isDropdownPresented: Bool = false
    @State private var dropdownContentHeight: CGFloat = 0
    @State private var itemWidths: [String: CGFloat] = [:]
    @State private var itemHeights: [String: CGFloat] = [:]
    @State private var itemPositions: [String: CGPoint] = [:]
    
    private let _appearance: TabsAppearance?
    private let items: [TabItem]
    private let selectedId: String?
    private let clipMode: TabsClipMode
    private let tabItemType: TabItemType
    private let stretch: Bool
    private let hasDivider: Bool
    private let onSelect: (String) -> Void
    
    private static let tabsContainerName = "tabs_container"
    
    /// Тип используемых TabItem
    public enum TabItemType {
        /// TabItem с текстом и опциональными иконками
        case `default`
        /// TabItem в стиле header
        case header
        /// TabItem только с иконкой
        case icon
    }
    
    /// Создает контейнер вкладок
    /// - Parameters:
    ///   - items: Массив элементов вкладок
    ///   - selectedId: ID выбранного элемента
    ///   - clipMode: Режим отображения (none/showMore/scroll)
    ///   - tabItemType: Тип используемых TabItem
    ///   - stretch: Растягивать элементы на всю ширину/высоту
    ///   - hasDivider: Показывать divider
    ///   - appearance: Внешний вид контейнера
    ///   - onSelect: Callback при выборе элемента
    public init(
        items: [TabItem],
        selectedId: String?,
        clipMode: TabsClipMode = .none,
        tabItemType: TabItemType = .default,
        stretch: Bool = true,
        hasDivider: Bool = true,
        appearance: TabsAppearance? = nil,
        onSelect: @escaping (String) -> Void
    ) {
        self.items = items
        self.selectedId = selectedId
        self.clipMode = clipMode
        self.tabItemType = tabItemType
        self.stretch = stretch
        self.hasDivider = hasDivider
        self._appearance = appearance
        self.onSelect = onSelect
    }
    
    public var body: some View {
        switch appearance.size.orientation {
        case .horizontal:
            horizontalLayout
        case .vertical:
            verticalLayout
        }
    }
    
    @ViewBuilder private var horizontalLayout: some View {
        VStack(spacing: 0) {
            switch clipMode {
            case .none, .showMore:
                VStack(spacing: 0) {
                    horizontalTabsStack
                    horizontalDividerView
                        .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
                }
                .onChange(of: itemWidths.count) { _ in }
                .id(visibleItems.count)
            case .scroll:
                HStack(spacing: 0) {
                    horizontalScrollArrow(isPrevious: true)
                        ScrollViewReader { proxy in
                            ScrollView(.horizontal, showsIndicators: false) {
                            VStack(spacing: 0) {
                                horizontalTabsStack
                                horizontalDividerView
                            }
                            .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                            .onChange(of: selectedId) { newId in
                                if let newId = newId {
                                    withAnimation {
                                        proxy.scrollTo(newId, anchor: .center)
                                    }
                                }
                            }
                        }
                    .onChange(of: itemWidths.count) { _ in }
                    horizontalScrollArrow(isPrevious: false)
                }
            }
        }
    }
    
    @ViewBuilder private var horizontalTabsStack: some View {
        HStack(spacing: 0) {
            ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                tabItemView(for: item)
                    .id(item.id)
                    .fixedSize()
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .preference(
                                    key: TabItemWidthPreferenceKey.self,
                                    value: [item.id: geometry.size.width]
                                )
                                .preference(
                                    key: TabItemPositionPreferenceKey.self,
                                    value: [item.id: CGPoint(x: geometry.frame(in: .named(Self.tabsContainerName)).minX, y: 0)]
                                )
                        }
                    )
                
                if index < visibleItems.count - 1 {
                    if stretch {
                        Spacer()
                    } else {
                        Spacer()
                            .frame(width: appearance.size.minSpacing)
                    }
                }
            }
        }
        .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
        .background(
            GeometryReader { geometry in
                Color.clear.preference(key: ContentWidthPreferenceKey.self, value: geometry.size.width)
            }
        )
        .coordinateSpace(name: Self.tabsContainerName)
        .onPreferenceChange(TabItemWidthPreferenceKey.self) { widths in
            itemWidths = widths
        }
        .onPreferenceChange(TabItemPositionPreferenceKey.self) { positions in
            itemPositions = positions
        }
        .onPreferenceChange(ContentWidthPreferenceKey.self) { width in
            contentWidth = width
        }
        .overlay(alignment: .bottomLeading) {
            horizontalIndicator
        }
    }
    
    @ViewBuilder private var verticalLayout: some View {
        switch clipMode {
        case .none, .showMore:
            HStack(alignment: .top, spacing: 0) {
                verticalDivider
                verticalTabsStack
                    .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
                    .frame(maxHeight: stretch ? .infinity : nil)
            }
            .onChange(of: itemHeights.count) { _ in }
            .id(visibleItems.count)
        case .scroll:
            VStack(spacing: 0) {
                verticalScrollArrow(isPrevious: true)
                HStack(alignment: .top, spacing: 0) {
                    ScrollViewReader { proxy in
                        ScrollView(.vertical, showsIndicators: false) {
                            HStack(alignment: .top, spacing: 0) {
                                verticalDivider
                                verticalTabsStack
                                    .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
                            }
                        }
                        .onChange(of: selectedId) { newId in
                            if let newId = newId {
                                withAnimation {
                                    proxy.scrollTo(newId, anchor: .center)
                                }
                            }
                        }
                        .onChange(of: itemHeights.count) { _ in }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(maxHeight: .infinity, alignment: .top)
                verticalScrollArrow(isPrevious: false)
            }
        }
    }
    
    @ViewBuilder private var verticalTabsStack: some View {
        VStack(spacing: 0) {
            ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                tabItemView(for: item)
                    .id(item.id)
                    .fixedSize()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        GeometryReader { geometry in
                            Color.clear
                                .preference(
                                    key: TabItemHeightPreferenceKey.self,
                                    value: [item.id: geometry.size.height]
                                )
                                .preference(
                                    key: TabItemPositionPreferenceKey.self,
                                    value: [item.id: CGPoint(x: 0, y: geometry.frame(in: .named(Self.tabsContainerName)).minY)]
                                )
                        }
                    )
                
                if index < visibleItems.count - 1 {
                    if stretch {
                        Spacer()
                    } else {
                        Color.clear
                            .frame(height: appearance.size.minSpacing)
                    }
                }
            }
        }
        .background(
            GeometryReader { geometry in
                Color.clear.preference(key: ContentHeightPreferenceKey.self, value: geometry.size.height)
            }
        )
        .coordinateSpace(name: Self.tabsContainerName)
        .onPreferenceChange(TabItemHeightPreferenceKey.self) { heights in
            itemHeights = heights
        }
        .onPreferenceChange(TabItemPositionPreferenceKey.self) { positions in
            itemPositions = positions
        }
        .onPreferenceChange(ContentHeightPreferenceKey.self) { height in
            contentHeight = height
        }
        .overlay(alignment: .topLeading) {
            verticalIndicator
        }
    }
    
    @ViewBuilder private func tabItemView(for item: TabItem) -> some View {
        let isShowMoreItem = isShowMoreButton(item)
        let isSelected = isShowMoreItem ? true : (item.id == selectedId)
        
        Button {
            if isShowMoreItem {
                isDropdownPresented.toggle()
            } else if !item.isDisabled {
                onSelect(item.id)
            }
        } label: {
            item.view
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
        .modifier(ShowMoreDropdownModifier(
            isShowMoreItem: isShowMoreItem,
            isPresented: $isDropdownPresented,
            clipMode: clipMode,
            appearance: appearance,
            colorScheme: colorScheme,
            dropdownContentHeight: dropdownContentHeight
        ))
    }
    
    private func isShowMoreButton(_ item: TabItem) -> Bool {
        if case .showMore(let showMoreItem, _, _) = clipMode {
            return item.id == showMoreItem.id
        }
        return false
    }
    
    private func isShowMoreButtonId(_ id: String) -> Bool {
        if case .showMore(let showMoreItem, _, _) = clipMode {
            return id == showMoreItem.id
        }
        return false
    }
    
    @ViewBuilder private func overflowButton(isPrevious: Bool) -> some View {
        Button {
            if isPrevious {
                selectPreviousItem()
            } else {
                selectNextItem()
            }
        } label: {
            let icon = isPrevious ? appearance.overflowPrevIcon : appearance.overflowNextIcon
            let color = isPrevious ? appearance.overflowPrevIconColor : appearance.overflowNextIconColor
            
            if let icon = icon {
                icon
                    .renderingMode(.template)
                    .foregroundStyle(color.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: appearance.size.overflowIconSize, height: appearance.size.overflowIconSize)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder private func horizontalScrollArrow(isPrevious: Bool) -> some View {
        let size = appearance.size.overflowIconSize
        if (isPrevious && hasPreviousItem) || (!isPrevious && hasNextItem) {
            overflowButton(isPrevious: isPrevious)
                .frame(width: size, height: size)

        } else {
            Color.clear
                .frame(width: size, height: size)

        }
    }
    
    @ViewBuilder private func verticalScrollArrow(isPrevious: Bool) -> some View {
        let size = appearance.size.overflowIconSize
        if (isPrevious && hasPreviousItem) || (!isPrevious && hasNextItem) {
            overflowButton(isPrevious: isPrevious)
                .frame(width: size, height: size)
        } else {
            Color.clear
                .frame(width: size, height: size)

        }
    }
    
    @ViewBuilder private var horizontalDividerView: some View {
        if hasDivider, appearance.size.dividerEnabled, let dividerAppearance = appearance.dividerAppearance {
            HStack(spacing: 0) {
                ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                    horizontalDividerSegment(for: item, at: index, appearance: dividerAppearance)
                }
            }
            .frame(width: stretch ? nil : (contentWidth > 0 ? contentWidth : nil), alignment: .leading)
            .frame(maxWidth: stretch ? .infinity : nil, alignment: .leading)
        }
    }
    
    @ViewBuilder private func horizontalDividerSegment(for item: TabItem, at index: Int, appearance dividerAppearance: DividerAppearance) -> some View {
        let width = itemWidths[item.id] ?? 100
        Rectangle()
            .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
            .frame(width: width, height: 1)
        
        if index < visibleItems.count - 1 {
            if stretch {
                Rectangle()
                    .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
            } else {
                Rectangle()
                    .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: self.appearance.size.minSpacing, height: 1)
            }
        }
    }
    
    @ViewBuilder private var verticalDivider: some View {
        if hasDivider, appearance.size.dividerEnabled, let dividerAppearance = appearance.dividerAppearance {
            VStack(spacing: 0) {
                ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                    verticalDividerSegment(for: item, at: index, appearance: dividerAppearance)
                }
            }
        }
    }
    
    @ViewBuilder private func verticalDividerSegment(for item: TabItem, at index: Int, appearance dividerAppearance: DividerAppearance) -> some View {
        if let height = itemHeights[item.id] {
            Group {
                Rectangle()
                    .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                    .frame(width: 1, height: height)
                
                if index < visibleItems.count - 1 {
                    if stretch {
                        Rectangle()
                            .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                            .frame(width: 1)
                            .frame(maxHeight: .infinity)
                    } else {
                        Rectangle()
                            .fill(dividerAppearance.backgroundColor.color(for: colorScheme, subtheme: subtheme))
                            .frame(width: 1, height: self.appearance.size.minSpacing)
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
    
    private func selectPreviousItem() {
        guard let selectedId = selectedId,
              let currentIndex = items.firstIndex(where: { $0.id == selectedId }),
              currentIndex > 0 else {
            return
        }
        
        let previousItem = items[currentIndex - 1]
        if !previousItem.isDisabled {
            onSelect(previousItem.id)
        }
    }
    
    private func selectNextItem() {
        guard let selectedId = selectedId,
              let currentIndex = items.firstIndex(where: { $0.id == selectedId }),
              currentIndex < items.count - 1 else {
            return
        }
        
        let nextItem = items[currentIndex + 1]
        if !nextItem.isDisabled {
            onSelect(nextItem.id)
        }
    }
    
    private var appearance: TabsAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var visibleItems: [TabItem] {
        switch clipMode {
        case .showMore(let showMoreItem, _, _):
            return items + [showMoreItem]
        default:
            return items
        }
    }
    
    private var tabItemHeight: CGFloat {
        guard let firstItemId = visibleItems.first?.id,
              let height = itemHeights[firstItemId] else {
            return 0
        }
        return height
    }
    
    private var hasPreviousItem: Bool {
        guard let selectedId = selectedId,
              let currentIndex = items.firstIndex(where: { $0.id == selectedId }) else {
            return false
        }
        return currentIndex > 0
    }
    
    private var hasNextItem: Bool {
        guard let selectedId = selectedId,
              let currentIndex = items.firstIndex(where: { $0.id == selectedId }) else {
            return false
        }
        return currentIndex < items.count - 1
    }
    
    @ViewBuilder private var horizontalIndicator: some View {
        if appearance.size.indicatorEnabled, 
           let selectedId = selectedId,
           !isShowMoreButtonId(selectedId),
           let selectedWidth = itemWidths[selectedId],
           let position = itemPositions[selectedId] {
            Rectangle()
                .fill(appearance.indicatorColor.color(for: colorScheme, subtheme: subtheme))
                .frame(
                    width: selectedWidth,
                    height: appearance.size.indicatorThickness
                )
                .offset(x: position.x, y: 0)
                .animation(.easeInOut(duration: 0.3), value: selectedId)
                .animation(.easeInOut(duration: 0.3), value: position.x)
        }
    }
    
    @ViewBuilder private var verticalIndicator: some View {
        if appearance.size.indicatorEnabled, 
           let selectedId = selectedId,
           !isShowMoreButtonId(selectedId),
           let selectedHeight = itemHeights[selectedId],
           let position = itemPositions[selectedId] {
            Rectangle()
                .fill(appearance.indicatorColor.color(for: colorScheme, subtheme: subtheme))
                .frame(
                    width: appearance.size.indicatorThickness,
                    height: selectedHeight
                )
                .offset(x: 0, y: position.y)
                .animation(.easeInOut(duration: 0.3), value: selectedId)
                .animation(.easeInOut(duration: 0.3), value: position.y)
        }
    }
    
}
