import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSImage_Ratio1x1: View {
    var body: some View {
        SDDSImage(
            image: Image(systemName: "photo"),
            appearance: Image.ratio_1_1.appearance
        )
        .frame(maxWidth: 120)
    }
}
