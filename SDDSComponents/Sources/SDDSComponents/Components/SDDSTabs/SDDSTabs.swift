import SwiftUI
import Foundation

/**
 Режим отображения вкладок при нехватке места
 */
public enum TabsClipMode {
    /// Обычный режим со скроллом
    case none
    /// Добавляется кнопка "Show All" для открытия dropdown menu
    case showMore(showAllText: String, items: [TabsItemData], maxHeight: CGFloat)
    /// Отображаются кнопки навигации для переключения на предыдущий/следующий элемент
    case scroll
}

/**
 Элемент вкладки для SDDSTabs
 */
public struct TabsItemData: Identifiable {
    public let id: String
    public let label: String
    public let value: String?
    public let counterValue: Int?
    public let icon: Image?
    public let isDisabled: Bool
    
    public init(
        id: String,
        label: String,
        value: String? = nil,
        counterValue: Int? = nil,
        icon: Image? = nil,
        isDisabled: Bool = false
    ) {
        self.id = id
        self.label = label
        self.value = value
        self.counterValue = counterValue
        self.icon = icon
        self.isDisabled = isDisabled
    }
}

/**
 `SDDSTabs` - контейнер вкладок с поддержкой различных режимов отображения.
 
 - Parameters:
    - items: Массив элементов вкладок
    - dropdownItems: Элементы для dropdown menu (используется в режиме showMore)
    - selectedId: ID выбранного элемента
    - clipMode: Режим отображения (none/showMore/scroll)
    - tabItemType: Тип используемых TabItem (default/header/icon)
    - appearance: Внешний вид контейнера
    - onSelect: Callback при выборе элемента
 
 ## Особенности
 - Поддерживает horizontal и vertical ориентации
 - Автоматический скролл при большом количестве элементов
 - Опциональный divider (внизу для horizontal, слева для vertical)
 - Анимированный индикатор под выбранным элементом
 - Режим showMore с dropdown menu
 - Режим scroll с кнопками навигации
 */
public struct SDDSTabs: View {
    @Environment(\.tabsAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @State private var contentWidth: CGFloat = 0
    @State private var isDropdownPresented: Bool = false
    @State private var dropdownContentHeight: CGFloat = 0
    @State private var itemWidths: [String: CGFloat] = [:]
    @State private var itemHeights: [String: CGFloat] = [:]
    @State private var itemPositions: [String: CGPoint] = [:]
    
    private let _appearance: TabsAppearance?
    private let items: [TabsItemData]
    private let selectedId: String?
    private let clipMode: TabsClipMode
    private let tabItemType: TabItemType
    private let stretch: Bool
    private let onSelect: (String) -> Void
    
    private static let tabsContainerName = "tabs_container"
    
    public enum TabItemType {
        case `default`
        case header
        case icon
    }
    
    public init(
        items: [TabsItemData],
        selectedId: String?,
        clipMode: TabsClipMode = .none,
        tabItemType: TabItemType = .default,
        stretch: Bool = true,
        appearance: TabsAppearance? = nil,
        onSelect: @escaping (String) -> Void
    ) {
        self.items = items
        self.selectedId = selectedId
        self.clipMode = clipMode
        self.tabItemType = tabItemType
        self.stretch = stretch
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
    
    // MARK: - Horizontal Layout
    
    @ViewBuilder private var horizontalLayout: some View {
        VStack(spacing: 0) {
            switch clipMode {
            case .none:
                ScrollView(.horizontal, showsIndicators: false) {
                    horizontalTabsStack
                }
            case .showMore(let showAllText, let dropdownItems, let maxHeight):
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        horizontalTabsStack
                        showMoreButton(text: showAllText, items: dropdownItems, maxHeight: maxHeight)
                    }
                }
            case .scroll:
                HStack(spacing: 0) {
                    overflowButton(isPrevious: true)
                    ScrollView(.horizontal, showsIndicators: false) {
                        horizontalTabsStack
                    }
                    .frame(maxWidth: .infinity)
                    overflowButton(isPrevious: false)
                }
            }
            
            // Divider ограничен шириной контента
            if appearance.size.dividerEnabled, let dividerAppearance = appearance.dividerAppearance {
                Divider()
                    .frame(width: contentWidth, height: 1)
                    .background(dividerAppearance.backgroundColor.color(for: colorScheme))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    @ViewBuilder private var horizontalTabsStack: some View {
        HStack(spacing: 0) {
            ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                tabItemView(for: item)
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
                        Spacer().frame(width: appearance.size.minSpacing)
                    }
                }
            }
        }
        .frame(maxWidth: stretch ? .infinity : nil)
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
    
    // MARK: - Vertical Layout
    
    @ViewBuilder private var verticalLayout: some View {
        HStack(spacing: 0) {
            // Divider
            if appearance.size.dividerEnabled, let dividerAppearance = appearance.dividerAppearance {
                Divider()
                    .frame(width: 1)
                    .background(dividerAppearance.backgroundColor.color(for: colorScheme))
            }
            
            switch clipMode {
            case .none:
                ScrollView(.vertical, showsIndicators: false) {
                    verticalTabsStack
                }
            case .showMore(let showAllText, let dropdownItems, let maxHeight):
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        verticalTabsStack
                        showMoreButton(text: showAllText, items: dropdownItems, maxHeight: maxHeight)
                    }
                }
            case .scroll:
                VStack(spacing: 0) {
                    overflowButton(isPrevious: true)
                    ScrollView(.vertical, showsIndicators: false) {
                        verticalTabsStack
                    }
                    .frame(maxHeight: .infinity)
                    overflowButton(isPrevious: false)
                }
            }
        }
    }
    
    @ViewBuilder private var verticalTabsStack: some View {
        VStack(spacing: 0) {
            ForEach(Array(visibleItems.enumerated()), id: \.element.id) { index, item in
                tabItemView(for: item)
                    .fixedSize()
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
                        Spacer().frame(height: appearance.size.minSpacing)
                    }
                }
            }
        }
        .frame(maxHeight: stretch ? .infinity : nil)
        .coordinateSpace(name: Self.tabsContainerName)
        .onPreferenceChange(TabItemHeightPreferenceKey.self) { heights in
            itemHeights = heights
        }
        .onPreferenceChange(TabItemPositionPreferenceKey.self) { positions in
            itemPositions = positions
        }
        .overlay(alignment: .topLeading) {
            verticalIndicator
        }
    }
    
    // MARK: - Helper Views
    
    @ViewBuilder private func tabItemView(for item: TabsItemData) -> some View {
        let isSelected = item.id == selectedId
        
        Button {
            if !item.isDisabled {
                onSelect(item.id)
            }
        } label: {
            switch tabItemType {
            case .icon:
                if let icon = item.icon {
                    SDDSTabItem(
                        icon: icon,
                        counterValue: item.counterValue,
                        isSelected: isSelected,
                        isDisabled: item.isDisabled,
                        orientation: appearance.size.orientation,
                        appearance: appearance.tabItemAppearance
                    )
                }
            default:
                SDDSTabItem(
                    label: item.label,
                    value: item.value,
                    counterValue: item.counterValue,
                    isSelected: isSelected,
                    isDisabled: item.isDisabled,
                    orientation: appearance.size.orientation,
                    appearance: appearance.tabItemAppearance,
                    startContent: {
                        if let icon = item.icon {
                            icon
                                .resizable()
                                .renderingMode(.template)
                        } else {
                            EmptyView()
                        }
                    },
                    contentRight: { EmptyView() },
                    actionContent: { EmptyView() }
                )
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    @ViewBuilder private func showMoreButton(text: String, items: [TabsItemData], maxHeight: CGFloat) -> some View {
        Button {
            isDropdownPresented.toggle()
        } label: {
            if text.isEmpty {
                // Если текст пустой, показываем только иконку
                if let disclosureIcon = appearance.disclosureIcon {
                    disclosureIcon
                        .renderingMode(.template)
                        .foregroundStyle(disclosureColor)
                        .frame(width: appearance.size.disclosureIconSize, height: appearance.size.disclosureIconSize)
                }
            } else {
                // Если текст есть, показываем текст
                Text(text)
                    .typography(appearance.disclosureTextTypography.typography(with: appearance.size) ?? .undefined)
                    .foregroundStyle(disclosureColor)
                    .fixedSize()
            }
        }
        .frame(height: appearance.size.orientation == .vertical ? tabItemHeight : nil)
        .buttonStyle(PlainButtonStyle())
        .applyIfLet(appearance.dropdownMenuAppearance) { view, menuAppearance in
            view.dropdownMenu(
                isPresented: $isDropdownPresented,
                appearance: menuAppearance,
                placement: .bottom,
                alignment: .end,
                contentHeight: dropdownListHeight(maxHeight: maxHeight),
                content: {
                    dropdownMenuContent(items: items, maxHeight: maxHeight)
                }
            )
        }
    }
    
    @ViewBuilder private func dropdownMenuContent(items: [TabsItemData], maxHeight: CGFloat) -> some View {
        if let listAppearance = appearance.dropdownMenuAppearance?.listAppearance {
            SDDSList(
                items: dropdownListItems(from: items),
                contentHeight: $dropdownContentHeight,
                showDividers: true,
                maxHeight: maxHeight,
                appearance: listAppearance
            )
            .frame(height: dropdownListHeight(maxHeight: maxHeight))
            .padding([.top, .bottom], appearance.dropdownMenuAppearance?.size.offset ?? 0)
        }
    }
    
    private func dropdownListItems(from items: [TabsItemData]) -> [SDDSListItem<EmptyView>] {
        items.map { item in
            SDDSListItem(
                title: item.label,
                rightContentEnabled: false,
                disabled: item.isDisabled,
                appearance: appearance.dropdownMenuAppearance?.listAppearance.listItemAppearance,
                onTap: {
                    onSelect(item.id)
                    isDropdownPresented = false
                }
            )
        }
    }
    
    private func dropdownListHeight(maxHeight: CGFloat) -> CGFloat {
        min(dropdownContentHeight, maxHeight)
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
                    .foregroundStyle(color.color(for: colorScheme))
                    .frame(width: appearance.size.overflowIconSize, height: appearance.size.overflowIconSize)
            }
        }
        .buttonStyle(PlainButtonStyle())
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
    
    // MARK: - Computed Properties
    
    private var appearance: TabsAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var disclosureColor: Color {
        appearance.disclosureColor.defaultColor.color(for: colorScheme)
    }
    
    private var visibleItems: [TabsItemData] {
        return items
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
    
    // MARK: - Indicators
    
    @ViewBuilder private var horizontalIndicator: some View {
        if appearance.size.indicatorEnabled, 
           let selectedId = selectedId, 
           let selectedWidth = itemWidths[selectedId],
           let position = itemPositions[selectedId] {
            Rectangle()
                .fill(appearance.indicatorColor.color(for: colorScheme))
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
           let selectedHeight = itemHeights[selectedId],
           let position = itemPositions[selectedId] {
            Rectangle()
                .fill(appearance.indicatorColor.color(for: colorScheme))
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

// MARK: - Preference Keys

private struct TabItemWidthPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGFloat] = [:]
    
    static func reduce(value: inout [String: CGFloat], nextValue: () -> [String: CGFloat]) {
        value.merge(nextValue()) { $1 }
    }
}

private struct TabItemHeightPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGFloat] = [:]
    
    static func reduce(value: inout [String: CGFloat], nextValue: () -> [String: CGFloat]) {
        value.merge(nextValue()) { $1 }
    }
}

private struct ContentWidthPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

private struct TabItemPositionPreferenceKey: PreferenceKey {
    static var defaultValue: [String: CGPoint] = [:]
    
    static func reduce(value: inout [String: CGPoint], nextValue: () -> [String: CGPoint]) {
        value.merge(nextValue()) { $1 }
    }
}
