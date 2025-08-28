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
    }
    
    public var body: some View {
        HStack(spacing: itemSpacing) {
            ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                SDDSTabBarItem(
                    data: item,
                    isSelected: index == selectedIndex
                )
                .environment(\.tabBarItemAppearance, tabBarItemAppearance)
                .padding([.leading], index == 0 ? contentPaddingStart : 0)
                .padding([.trailing], index == items.count - 1 ? contentPaddingEnd : 0)
                .padding([.top], contentPaddingTop)
                .padding([.bottom], contentPaddingBottom)
                .onTapGesture {
                    selectedIndex = index
                    onTabSelected?(index)
                    item.onTap?()
                }
            }
        }
    }
}

