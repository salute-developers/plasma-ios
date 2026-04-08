import SwiftUI
import SDDSComponents
import SDDSServTheme

struct SDDSImage_Ratio16x9: View {
    var body: some View {
        SDDSImage(
            image: Image(systemName: "photo"),
            appearance: Image.ratio_16_9.appearance
        )
        .frame(maxWidth: 200)
    }
}
