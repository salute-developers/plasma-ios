import Foundation
import SDDSComponents
import SDDSServTheme
import SwiftUI

// MARK: - Preview
struct SDDSProgressBarPreview: PreviewProvider {
    static var previews: some View {
        SDDSProgressView(
            progress: .constant(0.5),
            isEnabled: true,
            appearance: ProgressBar.default.accent.appearance
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}

struct DefaultProgressBarSize: ProgressBarSizeConfiguration {
    var height: CGFloat = 4
    var indicatorHeight: CGFloat = 4
    var indicatorPathDrawer: PathDrawer = CircleDrawer()
    var pathDrawer: PathDrawer = CircleDrawer()
    var cornerRadius: CGFloat = 0
    var indicatorCornerRadius: CGFloat = 0
    var debugDescription: String {
        "DefaultProgressBarSize"
    }
}
