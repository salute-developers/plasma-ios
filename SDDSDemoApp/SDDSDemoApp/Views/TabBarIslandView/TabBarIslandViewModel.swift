import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSIcons

final class TabBarIslandViewModel: ComponentViewModel<TabBarIslandVariationProvider> {
    @Published var selectedIndex: Int = 0
    @Published var tabBarIslandType: TabBarIslandType = .solid {
        didSet {
            self.variationProvider.tabBarIslandType = tabBarIslandType
            self.selectVariation(variations.first)
        }
    }
    @Published var extra = TabBarExtra.none
    
    var tabBarItems: [TabBarItemData] {
        return (0..<5).map { index in
            TabBarItemData(
                content: AnyView(icon),
                selectedContent: AnyView(selectedIcon),
                text: "Label",
                appearance: self.appearance.tabBarItemAppearance,
                extra: extraView,
                onTap: nil
            )
        }
    }
    
    @ViewBuilder
    private var icon: some View {
        Asset.starOutline36.image
            .resizable()
            .renderingMode(.template)
    }
    
    @ViewBuilder
    private var selectedIcon: some View {
        Asset.starFill36.image
            .resizable()
            .renderingMode(.template)
    }
    
    private var extraView: AnyView? {
        switch extra {
        case .none:
            nil
        case .counter:
            AnyView(counter)
        case .indicator:
            AnyView(indicator)
        }
    }
    
    private var counter: SDDSCounter {
        .init(
            text: "12",
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
    
    private var indicator: SDDSIndicator {
        .init()
    }
    
    private var itemCount: Int {
        5
    }
    
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: TabBarIslandVariationProvider(tabBarIslandType: .solid), componentViewLayoutMode: componentViewLayoutMode)
    }
}
