import Foundation
import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSCounterPreview: PreviewProvider {
    static var previews: some View {
        SDDSCounter(
            text: "1",
            appearance: Counter.l.warning.appearance,
            isAnimating: false,
            isHighlighted: false,
            isHovered: false
        )
    }
}
