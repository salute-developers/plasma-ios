import SwiftUI

public struct GradientView: View {
    private let kinds: [GradientKind]
    
    public init(colorScheme: ColorScheme, token: GradientToken) {
        self.kinds = token.kind(for: colorScheme)
    }
    
    public var body: some View {
        ZStack {
            ForEach(0..<kinds.count, id: \.self) { index in
                view(with: kinds[kinds.count - 1 - index])
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
