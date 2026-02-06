import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCircularProgressBar_Simple: View {
    var body: some View {
        SDDSCircularProgressBar(progress: 0.75, appearance: CircularProgressBar.l.default.appearance)
    }
}
