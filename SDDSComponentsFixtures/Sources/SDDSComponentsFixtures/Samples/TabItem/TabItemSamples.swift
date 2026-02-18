import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSTabItem_Simple: View {
    var body: some View {
        SDDSTabItem(
            label: "Tab 1",
            value: nil,
            counterValue: nil,
            isSelected: false,
            isDisabled: false,
            orientation: .horizontal,
            appearance: TabItemDefault.l.appearance,
            startContent: { EmptyView() },
            contentRight: { EmptyView() },
            actionContent: { EmptyView() }
        )
    }
}
