import Foundation
import SwiftUI

public protocol CarouselSizeConfiguration: SizeConfiguration, CustomDebugStringConvertible {
    var gap: CGFloat { get }
    var indicatorPadding: CGFloat { get }
    var nextButtonPadding: CGFloat { get }
    var prevButtonPadding: CGFloat { get }
    var buttonsPlacement: CarouselButtonsPlacement { get }
}

/// Дефолтные размеры, если тема не задала значения.
public struct DefaultCarouselSize: CarouselSizeConfiguration {
    public var gap: CGFloat
    public var indicatorPadding: CGFloat
    public var nextButtonPadding: CGFloat
    public var prevButtonPadding: CGFloat
    public var buttonsPlacement: CarouselButtonsPlacement

    public init(
        gap: CGFloat = 8,
        indicatorPadding: CGFloat = 8,
        nextButtonPadding: CGFloat = 8,
        prevButtonPadding: CGFloat = 8,
        buttonsPlacement: CarouselButtonsPlacement = .inner
    ) {
        self.gap = gap
        self.indicatorPadding = indicatorPadding
        self.nextButtonPadding = nextButtonPadding
        self.prevButtonPadding = prevButtonPadding
        self.buttonsPlacement = buttonsPlacement
    }

    public var debugDescription: String {
        "DefaultCarouselSize"
    }
}
