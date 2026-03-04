import SwiftUI
import UIKit
@_exported import SDDSThemeCore

/**
 `SDDSRectSkeleton` представляет собой компонент для отображения прямоугольного скелетона с анимированным градиентом.

 Компонент создает эффект загрузки с помощью анимированного градиента, который перемещается по прямоугольной области.
 Используется для индикации загрузки контента, когда данные еще не загружены.
 Анимация автоматически адаптируется к направлению макета: для LTR идет слева направо, для RTL справа налево.

 - Parameters:
    - appearance: Параметры внешнего вида скелетона (опционально).

 ## Окружение
 
 - `skeletonAppearance`: Стандартные настройки внешнего вида скелетона

 ## Пример использования

 ```swift
 SDDSRectSkeleton(
     appearance: SkeletonAppearance(
         shape: CornerRadiusDrawer(cornerRadius: 8),
         gradient: .gradient(.skeletonGradient),
         duration: 2000
     )
 )
 .frame(width: 200, height: 100)
 ```
 */
public struct SDDSRectSkeleton: View {
    @Environment(\.skeletonAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.subtheme) private var subtheme
    @Environment(\.layoutDirection) private var layoutDirection
    @State private var phase: CGFloat = -1.0
    private var _appearance: SkeletonAppearance?
    
    public init(appearance: SkeletonAppearance? = nil) {
        self._appearance = appearance
    }
    
    private var appearance: SkeletonAppearance {
        _appearance ?? environmentAppearance
    }
    
    /**
     Конвертирует миллисекунды в секунды для анимации.
     
     - Parameter ms: Время в миллисекундах.
     - Returns: Время в секундах.
     */
    private func msToSeconds(_ ms: Double) -> Double {
        ms / 1000.0
    }
    
    public var body: some View {
        Group {
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    ForEach(0..<3) { _ in
                        gradient
                    }
                }
                .clipped()
                .offset(x: phase * screenWidth)
            }
        }
        .shape(pathDrawer: appearance.shape)
        .onAppear {
            animate()
        }
        .onChange(of: restartAnimationKey) { _ in
            animate()
        }
    }
    
    /**
     Создает градиентный элемент для анимации.
     
     Каждый градиент имеет ширину экрана и повторяется для создания бесконечной анимации.
     */
    @ViewBuilder
    private var gradient: some View {
        switch appearance.gradient {
        case .color(let colorToken):
            TimelineView(.animation) { context in
                blinkingColor(colorToken, at: context.date)
                    .frame(width: screenWidth)
            }
        case .gradient(let gradientToken):
            Color.clear
                .gradient(gradientToken, colorScheme: colorScheme, subtheme: subtheme)
                .frame(width: screenWidth)
        }
    }
    
    @ViewBuilder
    private func blinkingColor(_ colorToken: ColorToken, at date: Date) -> some View {
        let color = colorToken.color(for: colorScheme, subtheme: subtheme)
        let uiColor = UIColor(color)
        let baseAlpha = uiColor.cgColor.alpha
        let animatedAlpha = min(1.0, baseAlpha + (0.08 * blinkProgress(at: date)))
        Color(uiColor.withAlphaComponent(animatedAlpha))
    }
    
    /**
     Запускает анимацию скелетона.
     
     Анимация адаптируется к направлению макета:
     - Для LTR (слева направо): градиент движется слева направо
     - Для RTL (справа налево): градиент движется справа налево
     */
    private func animate() {
        switch appearance.gradient {
        case .gradient:
            animateGradient()
        case .color:
            phase = -1.0
        }
    }
    
    private func animateGradient() {
        let targetPhase: CGFloat = layoutDirection == .rightToLeft ? -2.0 : 0
        let initialPhase: CGFloat = layoutDirection == .rightToLeft ? -1.0 : -1.0
        phase = initialPhase
        
        withAnimation(.linear(duration: durationInSeconds).repeatForever(autoreverses: false)) {
            phase = targetPhase
        }
    }
    
    private func blinkProgress(at date: Date) -> CGFloat {
        let duration = max(durationInSeconds, 0.001)
        let cycleDuration = duration * 2.0
        let positionInCycle = date.timeIntervalSinceReferenceDate.truncatingRemainder(dividingBy: cycleDuration)
        
        if positionInCycle <= duration {
            return CGFloat(positionInCycle / duration)
        } else {
            return CGFloat((cycleDuration - positionInCycle) / duration)
        }
    }
    
    private var restartAnimationKey: String {
        "\(colorScheme == .dark ? "dark" : "light")-\(String(describing: subtheme.subtheme))-\(layoutDirection == .rightToLeft ? "rtl" : "ltr")-\(durationInSeconds)-\(fillStyleAnimationKey)"
    }
    
    private var fillStyleAnimationKey: String {
        switch appearance.gradient {
        case .color(let colorToken):
            "color-\(colorToken.id)"
        case .gradient(let gradientToken):
            "gradient-\(gradientToken.id)"
        }
    }
    
    /**
     Получает длительность анимации в секундах.
     
     - Returns: Длительность анимации в секундах.
     */
    private var durationInSeconds: TimeInterval {
        msToSeconds(appearance.duration)
    }
    
    /**
     Получает ширину экрана для расчета анимации.
     
     - Returns: Ширина экрана в пикселях.
     */
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
}

/**
 Ключ окружения для настроек внешнего вида скелетона.
 */
private struct SkeletonAppearanceKey: EnvironmentKey {
    static var defaultValue: SkeletonAppearance = .init()
}

/**
 Расширение для доступа к настройкам скелетона через окружение.
 */
extension EnvironmentValues {
    var skeletonAppearance: SkeletonAppearance {
        get { self[SkeletonAppearanceKey.self] }
        set { self[SkeletonAppearanceKey.self] = newValue }
    }
} 
