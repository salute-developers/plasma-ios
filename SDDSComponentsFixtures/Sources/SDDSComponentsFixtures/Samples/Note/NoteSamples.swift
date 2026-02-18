import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSNote_Simple: View {
    var body: some View {
        SDDSNote(title: "Title", text: "Description")
            .environment(\.noteAppearance, Note.m.appearance)
    }
}
