import Foundation
import SwiftUI
import SDDSThemeCore

struct PlaceholderTextField<TextFieldContent: View, PlaceholderAfterContent: View, PlaceholderContent: View, PlaceholderBeforeContent: View>: View {
    @Binding var text: String
    @Binding var isFocused: Bool
    let textColor: Color
    let textAlignment: TextAlignment
    let cursorColor: Color
    let textTypography: TypographyToken
    let readOnly: Bool
    @ViewBuilder var placeholderBeforeContent: () -> PlaceholderBeforeContent
    @ViewBuilder var placeholderContent: () -> PlaceholderContent
    @ViewBuilder var placeholderAfterContent: () -> PlaceholderAfterContent
    
    let onEditingChanged: ((Bool) -> Void)
    var textFieldConfiguration: (FocusableTextField) -> TextFieldContent
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack(spacing: 0) {
                    placeholderBeforeContent()
                    placeholderContent()
                    placeholderAfterContent()
                }
            }
            textFieldConfiguration(
                FocusableTextField(
                    text: $text,
                    isFocused: $isFocused,
                    textColor: textColor,
                    textAlignment: textAlignment,
                    cursorColor: cursorColor,
                    typography: textTypography,
                    readOnly: readOnly,
                    onEditingChanged: onEditingChanged
                )
            )
            .id(readOnly)
        }
    }
}
