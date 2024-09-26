import Foundation
import SwiftUI
import SDDSThemeCore

struct PlaceholderTextField<TextFieldContent: View, PlaceholderAfterContent: View, PlaceholderBeforeContent: View>: View {
    @Binding var text: String
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    @ViewBuilder var placeholderBeforeContent: () -> PlaceholderBeforeContent
    @ViewBuilder var placeholderAfterContent: () -> PlaceholderAfterContent
    
    let onEditingChanged: ((Bool) -> Void)
    var textFieldConfiguration: (TextField<Text>) -> TextFieldContent
    
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
                TextField("", text: $text, onEditingChanged: onEditingChanged)
            )
        }
    }
}
