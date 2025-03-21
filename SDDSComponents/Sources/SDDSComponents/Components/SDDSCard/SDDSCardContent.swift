import SwiftUI
import SDDSThemeCore

public struct SDDSCardContent<Content: View>: View {
    let content: Content
    let backgroundColor: Color?
    let shapeContent: ShapeContent?
    
    public init(shapeContent: ShapeContent? = nil, backgroundColor: Color? = nil, @ViewBuilder content: () -> Content) {
        self.shapeContent = shapeContent
        self.backgroundColor = backgroundColor
        self.content = content()
    }
    
    public var body: some View {
        ZStack {
            content
        }
        .applyIfLet(backgroundColor) { $0.background($1) }
        .applyIfLet(shapeContent) { $0.shape(shapeContent: $1) }
    }
    
    private var contentWrapper: some View {
        ZStack {
            content
        }
    }
}
