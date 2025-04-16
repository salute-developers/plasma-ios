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
            appearance: ProgressBar.
        )
        .previewLayout(PreviewLayout.sizeThatFits)
        .previewDisplayName("Default")
    }
}
