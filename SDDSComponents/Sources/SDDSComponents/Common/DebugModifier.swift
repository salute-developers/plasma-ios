import Foundation
import SwiftUI

struct DebugModifier: ViewModifier {
    let borderWidth = 0.5
    let color: Color
    let condition: Bool
    
    func body(content: Content) -> some View {
        content
            .applyIf(condition) {
                $0.overlay(
                    Rectangle()
                        .stroke(color, lineWidth: borderWidth)
                )
            }
    }
}

public extension View {
    func debug(color: Color = .purple, condition: Bool = false) -> some View {
        self.modifier(DebugModifier(color: color, condition: condition))
    }
}
