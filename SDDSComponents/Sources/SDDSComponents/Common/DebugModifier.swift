import Foundation
import SwiftUI

public struct DebugModifier: ViewModifier {
    let borderWidth = 2.0
    
    public func body(content: Content) -> some View {
        content
            .overlay(
                Rectangle()
                    .stroke(Color.purple, lineWidth: borderWidth)
                    .padding(-borderWidth)
            )
    }
}

public extension View {
    func debug() -> some View {
        self.modifier(DebugModifier())
    }
}
