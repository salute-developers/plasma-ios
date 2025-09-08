import SwiftUI
import Foundation
import SDDSThemeCore

/**
 `TabBarContent` представляет собой общий контент для таб-бара, который может быть переиспользован
 в различных типах таб-баров (SDDSTabBar, SDDSTabBarIsland).
 */
public struct TabBarContent: View {
    private let items: [TabBarItemData]
    @Binding private var selectedIndex: Int
    private let onTabSelected: ((Int) -> Void)?
    private let itemSpacing: CGFloat
    private let contentPaddingStart: CGFloat
    private let contentPaddingEnd: CGFloat
    private let contentPaddingTop: CGFloat
    private let contentPaddingBottom: CGFloat
    private let tabBarItemAppearance: TabBarItemAppearance
    @State private var selectedItemSize: CGSize = .zero
    @Environment(\.colorScheme) private var colorScheme
    @State private var itemSizes: [Int: CGSize] = [:]
    @State private var containerWidth: CGFloat = 0
    @State private var selectedItemOffset: CGFloat = 0
    @State private var currentSelectedIndex: Int = 0
    
    public init(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        itemSpacing: CGFloat,
        contentPaddingStart: CGFloat,
        contentPaddingEnd: CGFloat,
        contentPaddingTop: CGFloat,
        contentPaddingBottom: CGFloat,
        tabBarItemAppearance: TabBarItemAppearance,
        onTabSelected: ((Int) -> Void)? = nil
    ) {
        self.items = items
        self._selectedIndex = selectedIndex
        self.itemSpacing = itemSpacing
        self.contentPaddingStart = contentPaddingStart
        self.contentPaddingEnd = contentPaddingEnd
        self.contentPaddingTop = contentPaddingTop
        self.contentPaddingBottom = contentPaddingBottom
        self.tabBarItemAppearance = tabBarItemAppearance
        self.onTabSelected = onTabSelected
        self._currentSelectedIndex = State(initialValue: selectedIndex.wrappedValue)
    }
    
    public var body: some View {
        ZStack(alignment: .leading) {
            selectedContent
            
            HStack(spacing: itemSpacing) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    SDDSTabBarItem(
                        data: item,
                        isSelected: index == currentSelectedIndex && item.allowSelection
                    )
                    .frame(width: calculatedItemWidth(for: index))
                    .frame(maxWidth: shouldExpandItem(at: index) ? CGFloat.infinity : nil)
                    .readSize { size in
                        self.itemSizes[index] = size
                        self.updateSelectedItemOffset()
                    }
                    .environment(\.tabBarItemAppearance, tabBarItemAppearance)
                    .padding([.leading], index == 0 ? contentPaddingStart : 0)
                    .padding([.trailing], index == items.count - 1 ? contentPaddingEnd : 0)
                    .padding([.top], contentPaddingTop)
                    .padding([.bottom], contentPaddingBottom)
                    .onTapGesture {
                        if item.allowSelection {
                            selectedIndex = index
                            currentSelectedIndex = index
                            updateSelectedItemOffset()
                            onTabSelected?(index)
                        }
                        item.onTap?()
                    }
                }
            }
        }
        .readSize { size in
            self.containerWidth = size.width
        }
    }
    
    @ViewBuilder private var selectedContent: some View {
        if currentSelectedIndex < items.count, let appearance = items[currentSelectedIndex].appearance, items[currentSelectedIndex].allowSelection {
            appearance.backgroundColor.selectedColor.color(for: colorScheme)
                .frame(width: itemSizes[currentSelectedIndex]?.width ?? 0, height: itemSizes[currentSelectedIndex]?.height ?? 0)
                .shape(pathDrawer: appearance.size.shape)
                .offset(x: selectedItemOffset)
        } else {
            EmptyView()
        }
    }
    
    private func updateSelectedItemOffset() {
        var offset: CGFloat = contentPaddingStart
        
        for i in 0..<currentSelectedIndex {
            offset += itemSizes[i]?.width ?? 0
            offset += itemSpacing
        }
        
        selectedItemOffset = offset
    }
    
    private var selectedItemData: TabBarItemData {
        return items[selectedIndex]
    }
    
    // MARK: - Width Calculation
    
    private func calculatedItemWidth(for index: Int) -> CGFloat? {
        guard containerWidth > 0, index < items.count else { return nil }
        
        let item = items[index]
        
        if let contentWidth = item.contentWidth {
            return contentWidth
        }
        
        return nil
    }
    
    private func shouldExpandItem(at index: Int) -> Bool {
        guard index < items.count else { return false }
        let item = items[index]
        
        if item.contentWidth != nil {
            return false
        }
        
        return true
    }
}
