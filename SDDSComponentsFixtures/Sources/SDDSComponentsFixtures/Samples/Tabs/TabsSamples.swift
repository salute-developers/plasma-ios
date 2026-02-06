import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSTabs_Simple: View {
    var body: some View {
        let items = [
            TabItem(id: "1", tabItem: SDDSTabItem(label: "Tab 1", orientation: .horizontal)),
            TabItem(id: "2", tabItem: SDDSTabItem(label: "Tab 2", orientation: .horizontal))
        ]
        return SDDSTabs(
            items: items,
            selectedId: "1",
            clipMode: .none,
            tabItemType: .default,
            stretch: true,
            hasDivider: true,
            appearance: TabsDefault.l.appearance,
            onSelect: { _ in }
        )
    }
}
