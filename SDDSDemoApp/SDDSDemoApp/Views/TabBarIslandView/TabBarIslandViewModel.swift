import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class TabBarIslandViewModel: ComponentViewModel<TabBarIslandVariationProvider> {
    @Published var selectedIndex: Int = 0
    @Published var tabBarIslandType: TabBarIslandType = .solid {
        didSet {
            self.variationProvider.tabBarIslandType = tabBarIslandType
            self.selectVariation(variations.first)
        }
    }
    
    var tabBarItems: [TabBarItemData] {
        let icon = Image(systemName: "star.fill")
        return (0..<5).map { index in
            TabBarItemData(
                content: AnyView(icon),
                text: "Label",
                appearance: self.appearance.tabBarItemAppearance,
                extra: nil,
                onTap: nil
            )
        }
    }
    
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: TabBarIslandVariationProvider(tabBarIslandType: .solid), componentViewLayoutMode: componentViewLayoutMode)
    }
}
