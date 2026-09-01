import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSDrawer_Simple: View {
    var body: some View {
        SDDSDrawer(
            backgroundColor: nil,
            onClose: nil,
            closePlacement: .right,
            hasHeader: false,
            hasFooter: false,
            header: { EmptyView() },
            content: { Text("Content") },
            footer: { EmptyView() }
        )
    }
}
