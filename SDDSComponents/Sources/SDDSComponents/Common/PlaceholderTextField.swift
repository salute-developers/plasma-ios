import Foundation
import SwiftUI
import SDDSThemeCore

struct PlaceholderTextField<TextFieldContent: View, PlaceholderContent: View>: View {
    @Binding var text: String
    let placeholder: String
    let placeholderColor: Color
    let placeholderTypography: TypographyToken
    @ViewBuilder var placeholderContent: () -> PlaceholderContent
    
    let onEditingChanged: ((Bool) -> Void)
    var textFieldConfiguration: (TextField<Text>) -> TextFieldContent
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                HStack(spacing: 0) {
                    Text(placeholder)
                        .typography(placeholderTypography)
                        .foregroundColor(placeholderColor)
                    placeholderContent()
                }
            }
            textFieldConfiguration(
                TextField("", text: $text, onEditingChanged: onEditingChanged)
            )
        }
    }
}
