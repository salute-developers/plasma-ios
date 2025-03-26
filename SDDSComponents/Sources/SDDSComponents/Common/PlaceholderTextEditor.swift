import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

struct PlaceholderTextEditor<PlaceholderContent: View>: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    @Binding var scrollMetrics: ScrollMetrics
    let readOnly: Bool
    @ViewBuilder var placeholderContent: () -> PlaceholderContent
    let textTypography: TypographyToken
    let appearance: TextAreaAppearance
    let showsVerticalScrollIndicator: Bool
    let trailingContentPadding: CGFloat
    let dynamicHeight: Bool
    let textColor: Color
    let colorScheme: ColorScheme
    let onChange: (_ newText: String) -> ()

    var body: some View {
        ZStack(alignment: .trailing) {
        ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    placeholderContent()
                }
                ExpandingTextEditor(
                    text: $text,
                    textHeight: $textHeight,
                    isFocused: $isFocused,
                    scrollMetrics: $scrollMetrics,
                    readOnly: readOnly,
                    typographyToken: textTypography,
                    accentColor: appearance.cursorColor.color(for: colorScheme),
                    textColor: textColor,
                    textAlignment: appearance.inputTextAlignment,
                    paddingInsets: .init(top: 0, leading: 0, bottom: 0, trailing: trailingContentPadding),
                    showsVerticalScrollIndicator: showsVerticalScrollIndicator,
                    dynamicHeight: dynamicHeight,
                    onChange: onChange
                )
                .frame(maxWidth: .infinity)
                .debug(color: Color.red, condition: true)
            }
            SDDSScrollbar(
                hasTrack: true,
                thumbHeight: 10,
                thumbWidth: 9,
                trackWidth: 7,
                thumbYOffset: scrollMetrics.thumbOffset()
            )
            .padding(.trailing, 2)
        }
        .applyIf(dynamicHeight) { $0.frame(height: textHeight) }
    }
}
