import Foundation
import SwiftUI

struct SpinnerView: View {
    let image: Image
    let foregroundColor: Color
    @State var isAnimating = false
    
    public var body: some View {
        image
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(foregroundColor)
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 1).repeatForever(autoreverses: false), value: isAnimating)
            .onAppear { self.isAnimating = true }
            .onDisappear { self.isAnimating = false }
    }
}
