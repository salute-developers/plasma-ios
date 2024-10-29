import Foundation
import SwiftUI


// MARK: - Preview
struct SDDSProgressViewPreview: PreviewProvider {
    static var previews: some View {
        Group {
            SDDSProgressView.accent(progress: 0)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("0%")
                .padding()
                .debug()
            
            SDDSProgressView.accent(progress: 0.3)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("30%")
                .padding()
                .debug()
            
            SDDSProgressView.accent(progress: 0.5)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("50%")
                .padding()
                .debug()
            
            SDDSProgressView.accent(progress: 0.8)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("80%")
                .padding()
                .debug()
            
            SDDSProgressView.accent(progress: 1.0)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("100%")
                .padding()
                .debug()
            
            SDDSProgressView.gradientAccent(progress: 0)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Gradient 0%")
                .padding()
                .debug()
            
            SDDSProgressView.gradientAccent(progress: 0.3)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Gradient 30%")
                .padding()
                .debug()
            
            SDDSProgressView.gradientAccent(progress: 0.5)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Gradient 50%")
                .padding()
                .debug()
            
            SDDSProgressView.gradientAccent(progress: 0.8)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Gradient 80%")
                .padding()
                .debug()
            
            SDDSProgressView.gradientAccent(progress: 1.0)
                .previewLayout(PreviewLayout.sizeThatFits)
                .previewDisplayName("Gradient 100%")
                .padding()
                .debug()
        }
    }
}

extension SDDSProgressView {
    static func accent(progress: CGFloat) -> SDDSProgressView {
        .init(
            progress: .constant(progress),
            isEnabled: true,
            appearance: .accent,
            size: DefaultProgressBarSize(),
            accessibility: ProgressBarAccessibility()
        )
    }
    
    static func gradientAccent(progress: CGFloat) -> SDDSProgressView {
        .init(
            progress: .constant(progress),
            isEnabled: true,
            appearance: .gradientAccent,
            size: DefaultProgressBarSize(),
            accessibility: ProgressBarAccessibility()
        )
    }
}
