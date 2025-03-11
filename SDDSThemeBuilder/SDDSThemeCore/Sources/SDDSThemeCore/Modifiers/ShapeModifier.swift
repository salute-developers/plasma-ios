import SwiftUI

/// Модификатор для применения токена скруглений
public struct ShapeModifier: ViewModifier {
    let shapeContent: ShapeContent
    
    public init(shapeContent: ShapeContent) {
        self.shapeContent = shapeContent
    }
    
    public init(token: ShapeToken) {
        self.shapeContent = ShapeContent(token: token)
    }
    
    public func body(content: Content) -> some View {
        content
            .clipShape(shapeContent)
    }
}
