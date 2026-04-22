import Foundation
import SwiftUI
@_exported import SDDSThemeCore

/// Внешний вид карусели: индикатор (точки), стили и иконки кнопок навигации, размеры.
public struct CarouselAppearance {
    public var size: CarouselSizeConfiguration
    public var indicatorAppearance: PaginationDotsAppearance
    public var nextButtonAppearance: ButtonAppearance
    public var prevButtonAppearance: ButtonAppearance
    public var nextButtonIcon: Image?
    public var prevButtonIcon: Image?

    public init(
        size: CarouselSizeConfiguration = DefaultCarouselSize(),
        indicatorAppearance: PaginationDotsAppearance = PaginationDotsAppearance(),
        nextButtonAppearance: ButtonAppearance = ButtonAppearance(),
        prevButtonAppearance: ButtonAppearance = ButtonAppearance(),
        nextButtonIcon: Image? = nil,
        prevButtonIcon: Image? = nil
    ) {
        self.size = size
        self.indicatorAppearance = indicatorAppearance
        self.nextButtonAppearance = nextButtonAppearance
        self.prevButtonAppearance = prevButtonAppearance
        self.nextButtonIcon = nextButtonIcon
        self.prevButtonIcon = prevButtonIcon
    }
}

extension CarouselAppearance: EnvironmentKey {
    public static var defaultValue: CarouselAppearance {
        EnvironmentValueProvider.shared.value(forKey: CarouselAppearance.self, fallback: CarouselAppearance())
    }
}
