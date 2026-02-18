import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSPopover_Simple: View {
    @State private var isPresented = true

    var body: some View {
        Text("Показать popover")
            .popover(
                isPresented: $isPresented,
                appearance: Popover.m.appearance,
                placement: .bottom,
                alignment: .start,
                tailEnabled: true
            ) {
                Text("Контент popover")
            }
    }
}
