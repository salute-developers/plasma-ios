import SwiftUI

public struct GradientView: View {
    private let kinds: [GradientKind]
    private let offset: CGFloat = 0
    
    public init(colorScheme: ColorScheme, token: GradientToken, offset: CGFloat = 0, subtheme: SubthemeData = SubthemeData()) {
        var gradientToken = token
        if !subtheme.isNone {
            gradientToken = subtheme.gradientMapper(subtheme.subtheme, token)
        }
        self.kinds = gradientToken.kind(for: colorScheme)
    }
    
    public var body: some View {
        ZStack {
            ForEach(0..<kinds.count, id: \.self) { index in
                view(with: kinds[kinds.count - 1 - index])
                    .offset(x: offset)
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
    
    private func gradient(token: GradientToken, for colorScheme: ColorScheme, subtheme: SubthemeData) -> GradientToken {
        guard !subtheme.isNone else {
            return token
        }
        return subtheme.gradientMapper(subtheme.subtheme, token)
    }
}
