import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSCircularProgressBar: View {
    @Environment(\.circularProgressBarAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let progress: Double
    private let suffix: String
    private let hasTrack: Bool
    private let _appearance: CircularProgressBarAppearance?
    private let content: AnyView?
    
    public init(
        progress: Double,
        suffix: String = "%",
        hasTrack: Bool = true,
        appearance: CircularProgressBarAppearance? = nil,
        content: AnyView? = nil
    ) {
        self.progress = min(max(progress, 0), 1)
        self.suffix = suffix
        self.hasTrack = hasTrack
        self.content = content
        self._appearance = appearance
    }
    
    public var body: some View {
        ZStack {
            if hasTrack {
                Circle()
                    .stroke(appearance.trackColor.color(for: colorScheme), lineWidth: appearance.size.trackThickness)
            }
            
            indicator
            
            if let content = content {
                content
            } else {
                if let valueTypography = valueTypography, appearance.valueEnabled {
                    Text("\(Int(progress * 100))\(suffix)")
                        .typography(valueTypography)
                        .foregroundColor(appearance.valueColor.color(for: colorScheme))
                }
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
        Arc(
            startAngle: .degrees(270),
            endAngle: .degrees(270 + 360 * progress),
            clockwise: false
        )
    }
    
    private var appearance: CircularProgressBarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var valueTypography: TypographyToken? {
        appearance.valueTypography.typography(with: appearance.size)
    }
}

extension SDDSCircularProgressBar: Equatable {
    public static func == (lhs: SDDSCircularProgressBar, rhs: SDDSCircularProgressBar) -> Bool {
        return lhs.appearance == rhs.appearance
        && lhs.progress == rhs.progress
        && lhs.hasTrack == rhs.hasTrack
        && lhs.suffix == rhs.suffix
    }
}
