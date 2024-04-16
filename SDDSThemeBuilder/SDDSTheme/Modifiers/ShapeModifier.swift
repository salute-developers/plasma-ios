import SwiftUI

struct ShapeModifier: ViewModifier {
    let token: ShapeToken.Description
    
    func body(content: Content) -> some View {
        content
            .cornerRadius(token.cornerRadius)
    }
}
