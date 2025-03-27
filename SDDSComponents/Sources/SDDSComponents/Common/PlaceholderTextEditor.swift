import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSComponents

struct PlaceholderTextEditor<PlaceholderContent: View>: View {
    @Binding var text: String
    @Binding var textHeight: CGFloat
    @Binding var isFocused: Bool
    @Binding var scrollbarData: ScrollbarData
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
                    scrollbarData: $scrollbarData,
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
            }
            .applyIf(dynamicHeight) { $0.frame(height: textHeight) }
            if !allContentInTextEditorIsVisible {
                SDDSScrollbar(
                    hasTrack: true,
                    thumbLength: scrollbarData.calculateThumbLength(),
                    trackThickness: appearance.size.scrollBarThickness,
                    thumbOffsetY: scrollbarData.thumbOffset(),
                    trackColor: appearance.scrollBarTrackColor.color(for: colorScheme),
                    thumbColor: appearance.scrollBarThumbColor.color(for: colorScheme)
                )
                .frame(width: appearance.size.scrollBarThickness)
                .padding(.trailing, appearance.size.scrollBarPaddings.trailing)
                .opacity(scrollbarData.scrollEnded ? 0 : 1)
                .animation(.easeInOut, value: scrollbarData.scrollEnded)
            }
        }
    }
}

extension PlaceholderTextEditor {
    var allContentInTextEditorIsVisible: Bool {
        scrollbarData.contentHeight == scrollbarData.visibleHeight
    }
}
