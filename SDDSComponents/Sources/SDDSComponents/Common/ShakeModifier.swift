import SwiftUI

/// Модификатор для применения анимации тряски
public struct ShakeModifier: ViewModifier {
    let amount: CGFloat
    let shakes: Int
    let isShaking: Bool
    
    public init(amount: CGFloat, shakes: Int, isShaking: Bool) {
        self.amount = amount
        self.shakes = shakes
        self.isShaking = isShaking
    }
    
    public func body(content: Content) -> some View {
        content
            .modifier(ShakeEffect(amount: amount, shakes: isShaking ? shakes : 0))
            .animation(isShaking ? .easeInOut(duration: 0.35) : .default, value: isShaking)
    }
}

struct ShakeEffect: GeometryEffect {
    var amount: CGFloat
    var shakes: Int
    var animatableData: CGFloat
    
    init(amount: CGFloat, shakes: Int) {
        self.amount = amount
        self.shakes = shakes
        self.animatableData = CGFloat(shakes)
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX:
            amount * sin(CGFloat(animatableData) * CGFloat(shakes) * CGFloat.pi * CGFloat(shakes)),
            y: 0))
    }
}

extension View {
    /// Применяет анимацию тряски к view
    /// - Parameters:
    ///   - amount: Амплитуда тряски
    ///   - shakes: Количество трясок
    ///   - isShaking: Флаг, указывающий, должна ли происходить тряска
    public func shake(amount: CGFloat, shakes: Int, isShaking: Bool) -> some View {
        self.modifier(ShakeModifier(amount: amount, shakes: shakes, isShaking: isShaking))
    }
}
