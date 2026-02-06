import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSOverlay_Simple: View {
    @State private var isPresented = false

    var body: some View {
        SDDSOverlay(isPresented: $isPresented, appearance: Overlay.default.appearance) {
            Text("Content")
        }
    }
}
