import SwiftUI

public extension View {
    func shadow(_ token: ShadowToken) -> some View {
        modifier(ShadowModifier(token: token))
    }
        
    func typography(_ token: TypographyToken) -> some View {
        modifier(TypographyModifier(token: token))
    }
    
    func gradient(_ token: GradientToken, offset: CGFloat = 0, colorScheme: ColorScheme = .light, subtheme: SubthemeData = SubthemeData()) -> some View {
        modifier(GradientModifier(token: token, offset: offset, colorScheme: colorScheme, subtheme: subtheme))
    }
}

public extension View {
    func shape(_ token: ShapeToken) -> some View {
        modifier(ShapeModifier(token: token))
    }
    
    func shape(shapeContent: ShapeContent) -> some View {
        modifier(ShapeModifier(shapeContent: shapeContent))
    }
    
    func shape(pathDrawer: PathDrawer, offset: CGSize = .zero) -> some View {
        modifier(ShapeModifier(shapeContent: ShapeContent(pathDrawer: pathDrawer), offset: offset))
    }
}
