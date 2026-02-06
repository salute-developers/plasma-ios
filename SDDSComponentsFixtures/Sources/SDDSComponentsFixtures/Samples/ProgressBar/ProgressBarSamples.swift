import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSProgressView_Simple: View {
    @State private var progress = 0.5

    var body: some View {
        SDDSProgressView(
            progress: $progress,
            isEnabled: true,
            appearance: ProgressBar.default.appearance
        )
    }
}
