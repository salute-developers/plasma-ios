import Foundation
import SwiftUI

struct SpinnerView: View {
    let image: Image
    let fillStyle: FillStyle
    @State var isAnimating = false
    
    public var body: some View {
        image
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .fillForeground(style: fillStyle)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear { self.isAnimating = true }
            .onDisappear { self.isAnimating = false }
    }

    init(image: Image, fillStyle: FillStyle) {
        self.image = image
        self.fillStyle = fillStyle
    }

    @available(*, deprecated, message: "Use init(image:fillStyle:) to support gradients.")
    init(image: Image, foregroundColor: Color) {
        self.image = image
        self.fillStyle = .color(ColorToken(darkColor: foregroundColor, lightColor: foregroundColor))
    }
}
