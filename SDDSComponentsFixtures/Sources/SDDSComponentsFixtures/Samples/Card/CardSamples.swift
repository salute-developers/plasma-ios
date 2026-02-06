import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSCard_Simple: View {
    var body: some View {
        SDDSCard(appearance: CardSolid.l.appearance) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Header")
                Text("Description")
            }
        }
    }
}
