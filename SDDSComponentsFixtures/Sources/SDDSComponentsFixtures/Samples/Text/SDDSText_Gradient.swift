import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSText_Gradient: View {
    var body: some View {
        SDDSText(
            "Gradient title",
            fillStyle: .gradient(GradientToken.textDefaultAccentGradient)
        )
    }
}
