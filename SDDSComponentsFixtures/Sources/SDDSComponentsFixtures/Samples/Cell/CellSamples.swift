import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCell_Simple: View {
    var body: some View {
        SDDSCell(
            appearance: Cell.l.appearance,
            alignment: .center,
            label: "label",
            title: "title",
            subtitle: "subtitle",
            disclosureEnabled: false,
            leftContent: { EmptyView() },
            rightContent: { EmptyView() }
        )
    }
}
