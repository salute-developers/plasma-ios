import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSToast_Simple: View {
    var body: some View {
        SDDSToast(
            text: "Текст тоста",
            contentEndPosition: .topRight,
            onClose: nil,
            appearance: Toast.pilled.appearance
        )
    }
}
