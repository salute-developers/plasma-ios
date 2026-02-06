import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSTooltip_Simple: View {
    @State private var isPresented = true

    var body: some View {
        Image(systemName: "info.circle")
            .tooltip(
                isPresented: $isPresented,
                appearance: Tooltip.m.appearance,
                width: nil,
                text: "Текст подсказки",
                placement: .top,
                alignment: .start,
                tailEnabled: true
            ) {
                Image(systemName: "info.circle")
            }
    }
}
