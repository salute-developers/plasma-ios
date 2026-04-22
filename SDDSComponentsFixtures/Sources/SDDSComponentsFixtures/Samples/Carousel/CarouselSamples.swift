import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCarousel_Simple: View {
    @State private var selection = 0

    var body: some View {
        SDDSCarousel(
            selection: $selection,
            pageCount: 5,
            appearance: Carousel.buttonsPlacementInner.appearance
        ) { index in
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(.systemGray5))
                Text("Page \(index + 1)")
            }
            .frame(height: 120)
        }
    }
}
