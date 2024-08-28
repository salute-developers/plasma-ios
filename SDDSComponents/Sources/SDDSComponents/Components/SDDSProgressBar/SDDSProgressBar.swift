import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/**
 `ProgressBarSizeConfiguration` определяет конфигурацию размеров для прогресс-бара.
 
 - Properties:
 - height: Высота прогресс-бара.
 - indicatorHeight: Высота индикатора прогресса.
 - cornerRadius: Радиус скругления углов прогресс-бара.
 - indicatorCornerRadius: Радиус скругления углов индикатора прогресса.
 */
public protocol ProgressBarSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var height: CGFloat { get }
    var indicatorHeight: CGFloat { get }
    var cornerRadius: CGFloat { get }
    var indicatorCornerRadius: CGFloat { get }
}

/**
 `ProgressBarAccessibility` определяет параметры доступности для прогресс-бара.
 
 - Properties:
 - progressLabel: Метка доступности для прогресс-бара.
 - progressHint: Подсказка для прогресс-бара.
 */
public struct ProgressBarAccessibility {
    public let progressLabel: String
    public let progressHint: String
    
    /**
     Инициализатор для создания параметров доступности прогресс-бара.
     
     - Parameters:
     - progressLabel: Метка доступности для прогресс-бара.
     - progressHint: Подсказка для прогресс-бара.
     */
    public init(
        progressLabel: String = "Progress",
        progressHint: String = "Shows the current progress."
    ) {
        self.progressLabel = progressLabel
        self.progressHint = progressHint
    }
}

/**
 `SDDSProgressView` представляет собой настраиваемый прогресс-бар, который может быть настроен с помощью различных параметров.
 
 - Parameters:
 - progress: Значение прогресса (от 0 до 1), отображаемое в виде заполняющейся полосы.
 - isEnabled: Флаг, указывающий, доступен ли прогресс-бар для взаимодействия.
 - appearance: Параметры внешнего вида прогресс-бара.
 - size: Конфигурация размеров для прогресс-бара.
 - accessibility: Параметры доступности для прогресс-бара.
 */
public struct SDDSProgressView: View {
    @Binding var progress: Double
    let isEnabled: Bool
    let appearance: ProgressBarAppearance
    let size: ProgressBarSizeConfiguration
    let accessibility: ProgressBarAccessibility
    
    @Environment(\.colorScheme) var colorScheme
    
    /**
     Инициализатор для создания прогресс-бара с заданными параметрами.
     
     - Parameters:
     - progress: Значение прогресса (от 0 до 1), отображаемое в виде заполняющейся полосы.
     - isEnabled: Флаг, указывающий, доступен ли прогресс-бар для взаимодействия.
     - appearance: Параметры внешнего вида прогресс-бара.
     - size: Конфигурация размеров для прогресс-бара.
     - accessibility: Параметры доступности для прогресс-бара.
     */
    public init(
        progress: Binding<Double>,
        isEnabled: Bool = true,
        appearance: ProgressBarAppearance,
        size: ProgressBarSizeConfiguration,
        accessibility: ProgressBarAccessibility = ProgressBarAccessibility()
    ) {
        self._progress = progress
        self.isEnabled = isEnabled
        self.appearance = appearance
        self.size = size
        self.accessibility = accessibility
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background track
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(appearance.trackColor.color(for: colorScheme))
                    .frame(width: geometry.size.width, height: size.height)
                
                // Progress indicator
                rectangle
                    .frame(width: CGFloat(normalizedProgress) * geometry.size.width, height: size.indicatorHeight)
                    .position(x: CGFloat(normalizedProgress) * geometry.size.width / 2, y: geometry.size.height / 2)
            }
        }
        .frame(height: size.indicatorHeight)
        .accessibilityLabel(Text(accessibility.progressLabel))
        .accessibilityValue(Text("\(Int(normalizedProgress * 100))%"))
        .accessibilityHint(Text(accessibility.progressHint))
        .disabled(!isEnabled)
    }
    
    @ViewBuilder
    private var rectangle: some View {
        switch appearance.tintFillStyle {
        case .color(let colorToken):
            RoundedRectangle(cornerRadius: size.indicatorCornerRadius)
                .fill(colorToken.color(for: colorScheme))
        case .gradient(let gradientToken):
            RoundedCornersMask(
                cornerRadius: size.indicatorCornerRadius,
                content: Rectangle().gradient(gradientToken)
            )
        }
    }
    
    private var normalizedProgress: Double {
        max(min(progress, 1.0), 0.0)
    }

}
