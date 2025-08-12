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
        ZStack(alignment: .leading) {
            selectedContent
            
            HStack(spacing: itemSpacing) {
                ForEach(Array(items.enumerated()), id: \.offset) { index, item in
                    SDDSTabBarItem(
                        data: item,
                        isSelected: index == selectedIndex
                    )
                    .readSize { size in
                        self.itemSizes[index] = size
                    }
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
    
    @ViewBuilder private var selectedContent: some View {
        if let appearance = selectedItemData.appearance {
            appearance.backgroundColor.selectedColor.color(for: colorScheme)
                .frame(width: itemSizes[selectedIndex]?.width ?? 0, height: itemSizes[selectedIndex]?.height ?? 0)
                .shape(pathDrawer: appearance.size.shape)
                .offset(x: selectedItemOffset)
        } else {
            EmptyView()
        }
    }
    
    private var selectedItemOffset: CGFloat {
        var offset: CGFloat = contentPaddingStart
        
        for i in 0..<selectedIndex {
            offset += itemSizes[i]?.width ?? 0
            offset += itemSpacing
        }
        
        return offset
    }
    
    private var selectedItemData: TabBarItemData {
        return items[selectedIndex]
    }
}

