import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSTabBarIsland_Simple: View {
    @State private var selectedIndex = 0

    var body: some View {
        let items = [
            TabBarItemData(content: nil, text: "Tab 1"),
            TabBarItemData(content: nil, text: "Tab 2")
        ]
        return SDDSTabBarIsland(
            items: items,
            selectedIndex: $selectedIndex,
            appearance: TabBarIsland.l.appearance
        )
    }
}
