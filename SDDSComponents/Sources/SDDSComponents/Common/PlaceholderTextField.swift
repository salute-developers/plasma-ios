import Foundation
import SwiftUI
@_exported import SDDSThemeCore

struct PlaceholderTextField<TextFieldContent: View, PlaceholderAfterContent: View, PlaceholderBeforeContent: View>: View {
    @Binding var text: String
    @Binding var isFocused: Bool
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    @ViewBuilder var placeholderBeforeContent: () -> PlaceholderBeforeContent
    @ViewBuilder var placeholderAfterContent: () -> PlaceholderAfterContent
    
    let onEditingChanged: ((Bool) -> Void)
    var textFieldConfiguration: (FocusableTextField) -> TextFieldContent
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack(spacing: 0) {
                    placeholderBeforeContent()
                    Text(placeholder)
                        .typography(placeholderTypography)
                        .foregroundColor(placeholderColor)
                    placeholderAfterContent()
                }
            }
            textFieldConfiguration(
                FocusableTextField(text: $text, isFocused: $isFocused, onEditingChanged: onEditingChanged)
            )
        }
    }
}
