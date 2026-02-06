import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSTextField_Simple: View {
    @State private var value = TextFieldValue.single("")

    var body: some View {
        SDDSTextField(
            value: $value,
            title: "Title",
            placeholder: "Enter the text",
            appearance: TextField.l.default.appearance
        )
    }
}
