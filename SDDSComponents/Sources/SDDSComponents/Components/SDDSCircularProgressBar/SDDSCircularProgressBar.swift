import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSCircularProgressBar: View {
    @Environment(\.circularProgressBarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let progress: Double
    private let _appearance: CircularProgressBarAppearance?
    
    public init(
        progress: Double,
        appearance: CircularProgressBarAppearance? = nil
    ) {
        self.progress = min(max(progress, 0), 1)
        self._appearance = appearance
    }
    
    public var body: some View {
        ZStack {
            Circle()
                .stroke(appearance.trackColor.color(for: colorScheme), lineWidth: appearance.size.trackThickness)
            
            indicator
                .rotationEffect(.degrees(-90))
            
            if appearance.valueEnabled {
                Text("\(Int(progress * 100))%")
                    .typography(valueTypography)
                    .foregroundColor(appearance.valueColor.color(for: colorScheme))
            }
        }
        .frame(width: appearance.size.width, height: appearance.size.height)
    }
    
    @ViewBuilder
    private var indicator: some View {
        switch appearance.indicatorColor {
        case .color(let colorToken):
            indicatorCircle
                .stroke(colorToken.color(for: colorScheme), lineWidth: appearance.size.progressThickness)
        case .gradient(let gradientToken):
            if let gradient = gradientToken.kind(for: colorScheme).first {
                switch gradient {
                case .linear(let value):
                    indicatorCircle
                        .stroke(value.gradient, lineWidth: appearance.size.progressThickness)
                case .angular(let value):
                    indicatorCircle
                        .stroke(value.gradient, lineWidth: appearance.size.progressThickness)
                case .radial(let value):
                    indicatorCircle
                        .stroke(value.gradient, lineWidth: appearance.size.progressThickness)
                case .color:
                    EmptyView()
                }
            } else {
                EmptyView()
            }
        }
    }
    
    private var indicatorCircle: some Shape {
        Circle()
            .trim(from: 0, to: CGFloat(progress))
    }
    
    private var appearance: CircularProgressBarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var valueTypography: TypographyToken {
        if let typography = appearance.valueTypography.typography(with: appearance.size) {
            return typography
        } else {
            fatalError("Undefined Button Typography for size \(appearance.size.debugDescription).")
        }
    }
}
