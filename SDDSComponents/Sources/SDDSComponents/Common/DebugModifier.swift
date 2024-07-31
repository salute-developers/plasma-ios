import Foundation
import SwiftUI

struct DebugModifier: ViewModifier {
    let borderWidth = 2.0
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .stroke(Color.purple, lineWidth: borderWidth)
                    .padding(-borderWidth)
            )
    }
}

extension View {
    func debug() -> some View {
        self.modifier(DebugModifier())
    }
}
