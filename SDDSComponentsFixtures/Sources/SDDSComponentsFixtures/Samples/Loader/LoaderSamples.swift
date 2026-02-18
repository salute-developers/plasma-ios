import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSLoader_Simple: View {
    var body: some View {
        SDDSLoader(appearance: Loader.default.appearance)
            .environment(\.spinnerData, SDDSSpinnerData(
                isAnimating: true,
                appearance: Spinner.l.default.appearance
            ))
    }
}
