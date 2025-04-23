import Foundation
import SwiftUI
import SDDSThemeCore

extension View {
    func scrollbar(scrollBarData: ScrollBarData, isScrolling: Binding<Bool> = .constant(false)) -> some View {
        self.modifier(ScrollBarModifier(scrollBarData: scrollBarData, isScrollingToBottom: isScrolling))
    }
}
