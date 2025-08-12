import Foundation
import Combine
import SwiftUI
import SDDSComponents

final class TabBarViewModel: ComponentViewModel<TabBarVariationProvider> {
    @Published var selectedIndex: Int = 0
    @Published var tabBarType: TabBarType = .solid {
        didSet {
            self.variationProvider.tabBarType = tabBarType
            self.selectVariation(variations.first)
        }
    }
    
    var tabBarItems: [TabBarItemData] {
        let icon = Image(systemName: "star.fill")
        let tabBarItemAppearance = self.appearance.tabBarItemAppearance
        return (0..<5).map { index in
            TabBarItemData(
                content: AnyView(icon),
                text: "Label",
                appearance: tabBarItemAppearance,
                extra: nil,
                onTap: { [weak self] in
                    self?.selectedIndex = index
                }
            )
        }
    }
        
    init(componentViewLayoutMode: ComponentViewLayoutMode = .screen) {
        super.init(variationProvider: TabBarVariationProvider(tabBarType: .solid), componentViewLayoutMode: componentViewLayoutMode)
    }
}
