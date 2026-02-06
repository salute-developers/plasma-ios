import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSSpinner_Simple: View {
    var body: some View {
        SDDSSpinner(isAnimating: true, appearance: Spinner.l.default.appearance)
    }
}
