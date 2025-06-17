import SwiftUI
@_exported import SDDSThemeCore

public struct SDDSRectSkeleton: View {
    @Environment(\.skeletonAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @State private var phase: CGFloat = -1.0
    @State private var timer: Timer? = nil
    private var _appearance: SkeletonAppearance?
    
    public init(appearance: SkeletonAppearance? = nil) {
        self._appearance = appearance
    }
    
    private var appearance: SkeletonAppearance {
        _appearance ?? environmentAppearance
    }
    
    private func msToSeconds(_ ms: Double) -> Double {
        ms / 1000.0
    }
    
    public var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(0..<3) { _ in
                    gradient
                }
            }
            .clipped()
            .shape(pathDrawer: appearance.shape)
            .offset(x: phase * screenWidth)
        }
        .onAppear {
            animate()
        }
        .onDisappear {
            timer?.invalidate()
            timer = nil
        }
    }
    
    @ViewBuilder
    private var gradient: some View {
        Color.clear
            .gradient(appearance.gradient)
            .frame(width: screenWidth)
    }
    
    private func animate() {
        withAnimation(.linear(duration: durationInSeconds).repeatForever(autoreverses: false)) {
            phase = -2.0
        }
    }
    
    private var durationInSeconds: TimeInterval {
        msToSeconds(appearance.duration)
    }
    
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

private struct SkeletonAppearanceKey: EnvironmentKey {
    static var defaultValue: SkeletonAppearance = .init()
}

extension EnvironmentValues {
    var skeletonAppearance: SkeletonAppearance {
        get { self[SkeletonAppearanceKey.self] }
        set { self[SkeletonAppearanceKey.self] = newValue }
    }
} 
