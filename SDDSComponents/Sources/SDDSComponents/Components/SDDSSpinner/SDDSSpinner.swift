import SwiftUI
import SDDSThemeCore

/**
 `SDDSSpinner` представляет собой компонент для отображения анимированного спиннера загрузки.

 - Parameters:
    - isAnimating: Флаг анимации вращения спиннера
    - appearance: Параметры внешнего вида спиннера (опционально)

 ## Окружение
 
 - `spinnerAppearance`: Стандартные настройки внешнего вида спиннера
 - `colorScheme`: Цветовая схема (light/dark)

 ## Особенности
 - Автоматически применяет градиент от startColor до endColor
 - Поддерживает настраиваемый угол отрисовки (angle)
 - Использует закругленные концы линии (strokeCap)
 - Анимированное вращение вокруг своей оси
 - Настраиваемые размеры и отступы

 ## Примеры использования

 ```swift
 // Базовый спиннер
 SDDSSpinner(
     isAnimating: true,
     appearance: Spinner.m.default.appearance
 )
 
 // Спинер с кастомными цветами
 SDDSSpinner(
     isAnimating: true,
     appearance: Spinner.l.accent.appearance
 )
 ```
 */
public struct SDDSSpinner: View {
    @Environment(\.spinnerAppearance) private var environmentAppearance
    @Environment(\.colorScheme) private var colorScheme
    
    private let isAnimating: Bool
    private let _appearance: SpinnerAppearance?
    
    @State private var rotation: Double = 0
    
    public init(
        isAnimating: Bool = true,
        appearance: SpinnerAppearance? = nil
    ) {
        self.isAnimating = isAnimating
        self._appearance = appearance
    }
    
    public init(data: SDDSSpinnerData) {
        self.init(isAnimating: data.isAnimating, appearance: data.appearance)
    }
    
    public var body: some View {
        ZStack {
            if appearance.backgroundColor != .clearColor {
                Circle()
                    .stroke(appearance.backgroundColor.color(for: colorScheme), lineWidth: lineThickness)
            }
            
            spinnerArc
                .stroke(
                    AngularGradient(
                        colors: [
                            appearance.endColor.color(for: colorScheme),
                            appearance.startColor.color(for: colorScheme)
                        ],
                        center: .center,
                        startAngle: .degrees(0),
                        endAngle: .degrees(angle)
                    ),
                    style: StrokeStyle(
                        lineWidth: lineThickness,
                        lineCap: appearance.strokeCap.cgValue
                    )
                )
                .rotationEffect(.degrees(rotation))
                .animation(
                    isAnimating ? 
                        .linear(duration: 1.0)
                        .repeatForever(autoreverses: false) : 
                        .default,
                    value: rotation
                )
        }
        .frame(width: appearance.size.size, height: appearance.size.size)
        .onAppear {
            if isAnimating {
                rotation = 360
            }
        }
        .onChange(of: isAnimating) { newValue in
            if newValue {
                rotation = 360
            } else {
                rotation = 0
            }
        }
    }
    
    private var spinnerArc: some Shape {
        Arc(
            startAngle: .degrees(0),
            endAngle: .degrees(angle),
            clockwise: false
        )
    }
    
    private var angle: CGFloat {
        // Рассчитываем угол с учетом strokeCap закруглений
        let radius = appearance.size.size / 2.0 - lineThickness / 2.0 // радиус дуги
        
        // Для strokeCap.round закругление равно половине толщины линии
        let capRadius = lineThickness / 2.0
        
        // Расстояние от центра до края закругления
        let capDistance = radius + capRadius
        
        // Угол, который занимает одно закругление
        let capAngle = (capRadius / capDistance) * (180.0 / .pi)
        
        // Нужен зазор между закруглениями (минимум 1pt)
        let minGapPoints: CGFloat = 1.0
        let gapAngle = (minGapPoints / capDistance) * (180.0 / .pi)
        
        // Общий угол для двух закруглений + зазор
        let totalGapAngle = capAngle * 2.0 + gapAngle
        
        return appearance.size.angle - totalGapAngle
    }
    
    private var appearance: SpinnerAppearance {
        _appearance ?? environmentAppearance
    }
    
    private var lineThickness: CGFloat {
        let minSpinnerThickness: CGFloat = 1.5
        let minSpinnerSize: CGFloat = 16
        return minSpinnerThickness * (appearance.size.size / minSpinnerSize)
    }
}

extension SDDSSpinner: Equatable {
    public static func == (lhs: SDDSSpinner, rhs: SDDSSpinner) -> Bool {
        return lhs.appearance == rhs.appearance && lhs.isAnimating == rhs.isAnimating
    }
} 
