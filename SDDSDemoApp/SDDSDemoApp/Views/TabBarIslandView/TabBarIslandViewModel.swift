import Foundation
import Combine
import SwiftUI
import SDDSComponents
import SDDSIcons
import SDDSServTheme

final class TabBarIslandViewModel: ComponentViewModel<TabBarIslandVariationProvider> {
    private let assistantContentWidth: CGFloat = 44
    @Published var selectedIndex: Int = 0
    @Published var tabBarIslandType: TabBarIslandType = .solid {
        didSet {
            self.variationProvider.tabBarIslandType = tabBarIslandType
            self.selectVariation(variations.first)
        }
    }
    @Published var extra = TabBarExtra.none
    @Published var countText: String = String(TabBarViewModel.defaultCount) {
        didSet {
            itemCount = min(max(Int(countText) ?? TabBarViewModel.defaultCount, 1), 10)
        }
    }
    @Published private(set) var itemCount: Int = TabBarViewModel.defaultCount
    @Published var customWidthEnabled = false
    
    var tabBarItems: [TabBarItemData] {
        let tabBarItemAppearance = self.appearance.tabBarItemAppearance
        var result = (0..<itemCount).map { index in
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
        if customWidthEnabled && itemCount % 2 == 0 {
            result.insert(
                TabBarItemData(
                    content: AnyView(assistant),
                    selectedContent: AnyView(assistant),
                    text: "",
                    contentWidth: assistantContentWidth,
                    allowSelection: false,
                    appearance: tabBarItemAppearance,
                    extra: AnyView(EmptyView()),
                    onTap: {}
                ),
                at: itemCount / 2
            )
        }
        return result
    }
    
    @ViewBuilder
    private var assistant: some View {
        VStack(spacing: 0) {
            Spacer()
            Image(systemName: "house.circle.fill")
                .resizable()
                .renderingMode(.template)
                .frame(width: assistantContentWidth, height: 44)
            Spacer()
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
        super.init(variationProvider: TabBarIslandVariationProvider(tabBarIslandType: .solid), componentViewLayoutMode: componentViewLayoutMode)
    }
}
