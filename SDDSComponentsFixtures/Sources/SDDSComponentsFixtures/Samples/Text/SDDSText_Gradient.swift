import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSText_Gradient: View {
    var body: some View {
        SDDSText(
            "Gradient title",
            fillStyle: .gradient(GradientToken.textDefaultAccentGradient)
        )
    }
}
