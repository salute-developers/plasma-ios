import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSIcons

enum TabBarExtra: String, CaseIterable {
    case counter
    case indicator
    case none
}

final class TabBarViewModel: ComponentViewModel<TabBarVariationProvider> {
    static let defaultCount: Int = 5
    
    @Published var selectedIndex: Int = 0
    @Published var tabBarType: TabBarType = .solid {
        didSet {
            self.variationProvider.tabBarType = tabBarType
            self.selectVariation(variations.first)
        }
    }
    @Published var extra = TabBarExtra.counter
    @Published var countText: String = String(TabBarViewModel.defaultCount) {
        didSet {
            itemCount = min(max(Int(countText) ?? TabBarViewModel.defaultCount, 1), 10)
        }
    }
    @Published private(set) var itemCount: Int = TabBarViewModel.defaultCount
    
    var tabBarItems: [TabBarItemData] {
        let tabBarItemAppearance = self.appearance.tabBarItemAppearance
        return (0..<itemCount).map { index in
            TabBarItemData(
                content: AnyView(icon),
                selectedContent: AnyView(selectedIcon),
                text: "Label",
                appearance: tabBarItemAppearance,
                extra: extraView,
                onTap: { [weak self] in
                    self?.selectedIndex = index
                }
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
        
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: TabBarVariationProvider(tabBarType: .solid), componentViewLayoutMode: componentViewLayoutMode)
    }
}
