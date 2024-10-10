import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

struct PlaceholderTextEditor: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    let readOnly: Bool
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    let textTypography: TypographyToken
    let appearance: TextAreaAppearance
    let colorScheme: ColorScheme
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
                isFocused: $isFocused,
                readOnly: readOnly,
                typographyToken: textTypography,
                accentColor: appearance.cursorColor.color(for: colorScheme),
                textColor: appearance.textColor.color(for: colorScheme),
                textAlignment: appearance.inputTextAlignment,
                paddingInsets: .init(),
                onChange: onChange
            )
            .frame(maxWidth: .infinity)
        }
        .frame(height: textHeight)
    }
}
