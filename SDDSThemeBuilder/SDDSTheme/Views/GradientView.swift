import SwiftUI

public struct GradientView: View {
    private let kinds: [GradientKind]
    
    public init(theme: ThemeStyle = UIScreen.themeStyle, token: GradientToken) {
        self.kinds = token.kind(for: theme)
    }
    
    public var body: some View {
        ZStack {
            ForEach(0..<kinds.count, id: \.self) { index in
                view(with: kinds[index])
            }
        }
    }
    
    private func view(with kind: GradientKind) -> some View {
        Group {
            switch kind {
            case .angular(let data):
                data.gradient
            case .linear(let data):
                data.gradient
            case .radial(let data):
                data.gradient
            case .color(let data):
                data.background
            }
        }
    }
}
