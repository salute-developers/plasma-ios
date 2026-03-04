import SwiftUI
@_exported import SDDSThemeCore

/**
 `SkeletonAppearance` определяет параметры внешнего вида скелетона.

 - Parameters:
    - shape: Форма скелетона (PathDrawer).
    - gradient: Градиент для анимации.
    - size: Конфигурация размеров скелетона.
    - duration: Длительность анимации в миллисекундах.

 ## Пример использования

 ```swift
 SkeletonAppearance(
     shape: CornerRadiusDrawer(cornerRadius: 8),
     gradient: .gradient(.skeletonGradient),
     size: ZeroSkeletonSizeConfiguration(),
     duration: 2000
 )
 ```
 */
public struct SkeletonAppearance {
    public var shape: PathDrawer
    public var gradient: FillStyle
    public var size: SkeletonSizeConfiguration
    public var duration: Double
    public var textTypography: TypographyConfiguration
    
    public init(
        shape: PathDrawer = DefaultPathDrawer(),
        gradient: FillStyle = .color(.clearColor),
        size: SkeletonSizeConfiguration = ZeroSkeletonSizeConfiguration(),
        duration: Double = 5.0,
        textTypography: TypographyConfiguration = .default
    ) {
        self.shape = shape
        self.gradient = gradient
        self.size = size
        self.duration = duration
        self.textTypography = textTypography
    }
}

/**
 Расширение для использования SkeletonAppearance как значения окружения.
 */
extension SkeletonAppearance: EnvironmentKey {
    public static var defaultValue: Self {
        EnvironmentValueProvider.shared.value(forKey: SkeletonAppearance.self, fallback: SkeletonAppearance())
    }
} 
