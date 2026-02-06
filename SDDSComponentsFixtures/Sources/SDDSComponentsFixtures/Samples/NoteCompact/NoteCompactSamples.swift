import SwiftUI
import SDDSComponents
import SDDSServTheme

// @DocSample
struct SDDSNoteCompact_Simple: View {
    var body: some View {
        SDDSNoteCompact(title: "Title", text: "Description")
            .environment(\.noteCompactAppearance, NoteCompact.m.appearance)
    }
}
