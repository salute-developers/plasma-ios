import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSText_DefaultColor: View {
    var body: some View {
        SDDSText(
            "Sample label",
            fillStyle: .color(ColorToken.textDefaultPrimary)
        )
    }
}
