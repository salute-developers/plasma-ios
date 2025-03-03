import SwiftUI

/// Модификатор для применения токена теней
public struct ShadowModifier: ViewModifier {
    let token: ShadowToken
    
    public func body(content: Content) -> some View {
        ZStack {
            ForEach(0..<token.layers.count, id: \.self) { index in
                content
                    .shadow(
                        color: layer(index).color,
                        radius: layer(index).blurRadius,
                        x: layer(index).offsetX,
                        y: layer(index).offsetY
                    )
                    .applyIf(layer(index).spreadRadius > 0) {
                        $0.shadow(
                            color: layer(index).color,
                            radius: layer(index).blurRadius + layer(index).spreadRadius,
                            x: layer(index).offsetX + layer(index).spreadRadius,
                            y: layer(index).offsetY + layer(index).spreadRadius
                        )
                    }
            }
        }
    }
    
    private func layer(_ index: Int) -> ShadowToken.Layer {
        token.layers[index]
    }
}

struct ShadowDemoView: View {
    let token = ShadowToken(
        layers: [
            ShadowToken.Layer(
                color: Color(UIColor(hex: "#08080829")),
                offsetX: 0,
                offsetY: 4,
                blurRadius: 12,
                spreadRadius: -3
            ),
            ShadowToken.Layer(
                color: Color(UIColor(hex: "#00000014")),
                offsetX: 0,
                offsetY: 1,
                blurRadius: 4,
                spreadRadius: -2
            )
        ]
    )
    
    var body: some View {
        Rectangle()
            .fill(Color.green)
            .frame(width: 120, height: 160)
            .cornerRadius(32)
            .shadow(token)
    }
}

#Preview {
    ShadowDemoView()
}
