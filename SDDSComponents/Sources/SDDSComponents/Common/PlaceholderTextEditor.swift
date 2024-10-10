import Foundation
import SwiftUI
import SDDSThemeCore

struct PlaceholderTextEditor<TextEditorContent: View>: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    let textTypography: TypographyToken
    
    var textEditorConfiguration: (ExpandingTextEditor) -> TextEditorContent
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack(spacing: 0) {
                    Text(placeholder)
                        .typography(placeholderTypography)
                        .foregroundColor(placeholderColor)
                }
            }
            textEditorConfiguration(
                ExpandingTextEditor(text: $text, textHeight: $textHeight, typographyToken: textTypography)
            )
        }
        .frame(height: textHeight)
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
