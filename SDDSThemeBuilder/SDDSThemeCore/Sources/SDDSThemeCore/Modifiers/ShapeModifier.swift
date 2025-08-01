import SwiftUI

/// Модификатор для применения токена скруглений
public struct ShapeModifier: ViewModifier {
    let shapeContent: ShapeContent
    let offset: CGSize
    
    public init(shapeContent: ShapeContent, offset: CGSize = .zero) {
        self.shapeContent = shapeContent
        self.offset = offset
    }
    
    public init(token: ShapeToken, offset: CGSize = .zero) {
        self.shapeContent = ShapeContent(token: token)
        self.offset = offset
    }
    
    public func body(content: Content) -> some View {
            content
                .clipShape(shapeContent)
    }
}
