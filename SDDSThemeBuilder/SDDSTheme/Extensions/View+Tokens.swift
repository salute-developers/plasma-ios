import SwiftUI

public extension View {
    func applyShadow(_ token: ShadowToken) -> some View {
        modifier(ShadowModifier(token: token))
    }
    
    func applyShape(_ token: ShapeToken) -> some View {
        modifier(ShapeModifier(token: token))
    }
    
    func applyTypography(_ token: TypographyToken) -> some View {
        modifier(TypographyModifier(token: token))
    }
}
