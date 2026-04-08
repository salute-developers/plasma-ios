import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSIcon_Gradient: View {
    var body: some View {
        SDDSIcon(
            Image(systemName: "star.fill"),
            fillStyle: .gradient(GradientToken.surfaceDefaultAccentGradient),
            sideLength: 32
        )
    }
}
