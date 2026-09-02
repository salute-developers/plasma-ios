import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCounter_Simple: View {
    var body: some View {
        SDDSCounter(
            text: "1",
            isAnimating: false,
            isHighlighted: false,
            isHovered: false,
            isSelected: false
        )
    }
}
