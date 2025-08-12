import SwiftUI
import Foundation
import SDDSThemeCore

public struct SDDSTabBarIsland: View {
    @Environment(\.tabBarIslandAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let _appearance: TabBarIslandAppearance?
    private let items: [TabBarItemData]
    @Binding private var selectedIndex: Int
    private let onTabSelected: ((Int) -> Void)?
    
    public init(
        items: [TabBarItemData],
        selectedIndex: Binding<Int>,
        appearance: TabBarIslandAppearance? = nil,
        onTabSelected: ((Int) -> Void)? = nil
    ) {
        self.items = items
        self._selectedIndex = selectedIndex
        self._appearance = appearance
        self.onTabSelected = onTabSelected
    }
    
    public var body: some View {
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
        .background(backgroundLayers)
        .padding([.leading], appearance.size.paddingStart)
        .padding([.trailing], appearance.size.paddingEnd)
        .shadow(appearance.shadow)
    }
    
    private var topPathDrawer: PathDrawer {
        if let drawer = appearance.size.topShape as? CornerRadiusDrawer {
            return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.top))
        } else {
            return appearance.size.topShape
        }
    }
    
    private var bottomPathDrawer: PathDrawer {
        if let drawer = appearance.size.bottomShape as? CornerRadiusDrawer {
            return CornerRadiusDrawer(cornerRadius: drawer.cornerRadius, cornerType: .specific(CornerRadiusDrawerType.bottom))
        } else {
            return appearance.size.topShape
        }
    }
    
    // MARK: - Background Layers
    
    @ViewBuilder
    private var backgroundLayers: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Rectangle()
                    .fill(appearance.backgroundColor.color(for: colorScheme))
                    .shape(pathDrawer: topPathDrawer)
                    .frame(height: geometry.size.height / 2)
                
                Rectangle()
                    .fill(appearance.backgroundColor.color(for: colorScheme))
                    .shape(pathDrawer: bottomPathDrawer)
                    .frame(height: geometry.size.height / 2)
                    .offset(y: geometry.size.height / 2)
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var appearance: TabBarIslandAppearance {
        _appearance ?? environmentAppearance
    }
}
