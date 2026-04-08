import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSIcon_TintColor: View {
    var body: some View {
        SDDSIcon(
            Image(systemName: "heart.fill"),
            fillStyle: .color(ColorToken.textDefaultAccent),
            sideLength: 32
        )
    }
}
