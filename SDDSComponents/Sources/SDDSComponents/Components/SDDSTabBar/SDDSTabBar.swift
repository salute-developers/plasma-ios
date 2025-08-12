import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSTabBar: View {
    @Environment(\.tabBarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.safeAreaInsets) private var safeAreaInsets
    
    private let _appearance: TabBarAppearance?
    private let items: [TabBarItemData]
    @Binding private var selectedIndex: Int
    private let onTabSelected: ((Int) -> Void)?
    
    public init(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        appearance: TabBarAppearance? = nil,
        onTabSelected: ((Int) -> Void)? = nil
    ) {
        self.items = items
        self._selectedIndex = selectedIndex
        self._appearance = appearance
        self.onTabSelected = onTabSelected
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .fill(appearance.dividerColor.color(for: colorScheme))
                .frame(height: appearance.size.dividerThickness)
            
            TabBarContent(
                items: items,
                selectedIndex: $selectedIndex,
                itemSpacing: appearance.size.itemSpacing,
                contentPaddingStart: appearance.size.contentPaddingStart,
                contentPaddingEnd: appearance.size.contentPaddingEnd,
                contentPaddingTop: appearance.size.contentPaddingTop,
                contentPaddingBottom: appearance.size.contentPaddingBottom,
                tabBarItemAppearance: appearance.tabBarItemAppearance,
                onTabSelected: onTabSelected
            )
            
            Rectangle()
                .fill(appearance.backgroundColor.color(for: colorScheme))
                .frame(maxWidth: .infinity)
                .frame(height: safeAreaInsets.bottom)
        }
        .frame(maxWidth: .infinity)
        .background(backgroundColor.color(for: colorScheme))
        .shape(pathDrawer: topPathDrawer)
        .shadow(appearance.shadow)
    }
    
    // MARK: - Computed Properties
    
    private var topPathDrawer: PathDrawer {
        if let drawer = appearance.size.topShape as? CornerRadiusDrawer {
            return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.top))
        } else {
            return appearance.size.topShape
        }
    }
    
    private var appearance: TabBarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var backgroundColor: ColorToken {
        appearance.backgroundColor
    }
}
