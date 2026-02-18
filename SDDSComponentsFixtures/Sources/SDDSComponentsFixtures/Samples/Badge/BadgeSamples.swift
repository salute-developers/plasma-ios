import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSBadge_Simple: View {
    var body: some View {
        SDDSBadge(
            label: "Label",
            image: nil,
            alignment: .leading,
            style: .basic,
            appearance: Badge.m.default.appearance
        )
    }
}
