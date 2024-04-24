import SwiftUI

public extension View {
    func applyShadow(_ token: ShadowToken.Description) -> some View {
        modifier(ShadowModifier(token: token))
    }
    
    func applyShape(_ token: ShapeToken.Description) -> some View {
        modifier(ShapeModifier(token: token))
    }
}
