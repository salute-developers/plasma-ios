import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

struct PlaceholderTextEditor: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    let textTypography: TypographyToken
    let appearance: TextAreaAppearance
    let colorScheme: ColorScheme
    let size: TextAreaSizeConfiguration
    let onChange: (_ newText: String) -> ()

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack(spacing: 0) {
                    Text(placeholder)
                        .typography(placeholderTypography)
                        .foregroundColor(placeholderColor)
                }
            }
            ExpandingTextEditor(
                text: $text,
                textHeight: $textHeight,
                typographyToken: textTypography,
                accentColor: appearance.cursorColor.color(for: colorScheme),
                textColor: appearance.textColor.color(for: colorScheme),
                textAlignment: appearance.inputTextAlignment,
                paddingInsets: .init()
            )
            .frame(maxWidth: .infinity)
        }
        .frame(height: textHeight)
    }
}

#Preview {
    SDDSTextAreaPreview.previews
}
