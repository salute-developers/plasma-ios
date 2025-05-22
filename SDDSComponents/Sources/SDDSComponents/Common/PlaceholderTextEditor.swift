import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

struct PlaceholderTextEditor<PlaceholderContent: View>: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    @Binding var isScrolling: Bool
    let readOnly: Bool
    @ViewBuilder var placeholderContent: () -> PlaceholderContent
    let textTypography: TypographyToken
    let appearance: TextAreaAppearance
    let showsVerticalScrollIndicator: Bool
    let trailingContentPadding: CGFloat
    let dynamicHeight: Bool
    let textColor: Color
    let numberOfLines: Int
    let colorScheme: ColorScheme
    let onChange: (_ newText: String) -> ()

    var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                placeholderContent()
            }
            ExpandingTextEditor(
                text: $text,
                textHeight: $textHeight,
                isFocused: $isFocused,
                isScrolling: $isScrolling,
                readOnly: readOnly,
                typographyToken: textTypography,
                accentColor: appearance.cursorColor.color(for: colorScheme),
                textColor: textColor,
                textAlignment: appearance.inputTextAlignment,
                paddingInsets: .init(top: 0, leading: 0, bottom: 0, trailing: trailingContentPadding),
                showsVerticalScrollIndicator: showsVerticalScrollIndicator,
                dynamicHeight: dynamicHeight,
                numberOfLines: numberOfLines,
                onChange: onChange
            )
            .frame(maxWidth: .infinity)
        }
        .applyIf(dynamicHeight) { $0.frame(height: textHeight) }
    }
}
