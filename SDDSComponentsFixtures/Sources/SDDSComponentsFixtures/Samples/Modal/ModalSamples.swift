import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSModal_Simple: View {
    var body: some View {
        SDDSModal(
            content: { Text("Content") },
            closeImage: nil,
            appearance: Modal.default.appearance,
            onClose: {}
        )
    }
}
