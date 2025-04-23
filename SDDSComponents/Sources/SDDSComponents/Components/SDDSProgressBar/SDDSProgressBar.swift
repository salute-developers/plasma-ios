import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `SDDSProgressView` представляет собой настраиваемый прогресс-бар, который может быть настроен с помощью различных параметров.
 
 - Parameters:
 - progress: Значение прогресса (от 0 до 1), отображаемое в виде заполняющейся полосы.
 - isEnabled: Флаг, указывающий, доступен ли прогресс-бар для взаимодействия.
 - appearance: Параметры внешнего вида прогресс-бара.
 - accessibility: Параметры доступности для прогресс-бара.
 */
public struct SDDSProgressView: View {
    @Binding var progress: Double
    let isEnabled: Bool
    private let _appearance: ProgressBarAppearance?
    let accessibility: ProgressBarAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.progressBarAppearance) private var environmentAppearance
    
    /**
     Инициализатор для создания прогресс-бара с заданными параметрами.
     
     - Parameters:
     - progress: Значение прогресса (от 0 до 1), отображаемое в виде заполняющейся полосы.
     - isEnabled: Флаг, указывающий, доступен ли прогресс-бар для взаимодействия.
     - appearance: Параметры внешнего вида прогресс-бара.
     - accessibility: Параметры доступности для прогресс-бара.
     */
    public init(
        progress: Binding<Double>,
        isEnabled: Bool = true,
        appearance: ProgressBarAppearance? = nil,
        accessibility: ProgressBarAccessibility = ProgressBarAccessibility()
    ) {
        self._progress = progress
        self.isEnabled = isEnabled
        self._appearance = appearance
        self.accessibility = accessibility
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background track
                appearance.size.pathDrawer
                    .path(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: geometry.size.width, height: appearance.size.indicatorHeight)))
                    .fill(appearance.trackColor.color(for: colorScheme))
//                    .frame(width: geometry.size.width, height: 4)
                    .onAppear {
                        let _ = print("COLOR: \(appearance.trackColor)")
                        let _ = print("GEOMETY Width: \(geometry.size.width)")
                        let _ = print("Height: \(appearance.size.height)")
                    }
                
                // Progress indicator
                rectangle(CGFloat(normalizedProgress) * geometry.size.width)
                    .frame(width: CGFloat(normalizedProgress) * geometry.size.width, height: appearance.size.indicatorHeight)
                    .position(x: CGFloat(normalizedProgress) * geometry.size.width / 2, y: geometry.size.height / 2)
                    .onAppear {
                        let _ = print("geomertyWidth: \(CGFloat(normalizedProgress) * geometry.size.width / 2)")
                    }
            }
        }
        .frame(height: appearance.size.indicatorHeight)
        .clipped()
        .accessibilityLabel(Text(accessibility.progressLabel))
        .accessibilityValue(Text("\(Int(normalizedProgress * 100))%"))
        .accessibilityHint(Text(accessibility.progressHint))
        .disabled(!isEnabled)
    }
    
    @ViewBuilder
    private func rectangle(_ progressWidth: CGFloat) -> some View {
        switch appearance.tintFillStyle {
        case .color(let colorToken):
            RoundedRectangle(cornerRadius: appearance.size.indicatorCornerRadius)
//            pathDrawer(width: progressWidth)
//                .foregroundColor(colorToken.color(for: colorScheme))
        case .gradient(let gradientToken):
            RoundedCornersMask(
                cornerRadius: appearance.size.indicatorCornerRadius,
                content: pathDrawer(width: progressWidth).gradient(gradientToken)
            )
        }
    }
    
    private var normalizedProgress: Double {
        max(min(progress, 1.0), 0.0)
    }

    var appearance: ProgressBarAppearance {
        _appearance ?? environmentAppearance
    }
    
    private func pathDrawer(width: CGFloat) -> some View {
        appearance.size.indicatorPathDrawer
            .path(in: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: width, height: appearance.size.indicatorHeight)))
    }
}

extension SDDSProgressView: Equatable {
    public static func == (lhs: SDDSProgressView, rhs: SDDSProgressView) -> Bool {
        return lhs.appearance == rhs.appearance && lhs.progress == rhs.progress
    }
}
