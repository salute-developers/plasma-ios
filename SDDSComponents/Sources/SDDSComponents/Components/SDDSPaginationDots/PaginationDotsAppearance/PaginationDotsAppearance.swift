import Foundation
import SwiftUI
import SDDSThemeCore

public struct PaginationDotsAppearance {
    public var size: PaginationDotsSizeConfiguration = DefaultPaginationDotsSize()
    @available(*, deprecated, message: "ButtonColor is deprecated and will be replaced by StatefulColor in a future release.")
    public var dotBackgroundStatefulColor: ButtonColor = ButtonColor(defaultColor: .clearColor)

    @available(*, deprecated, message: "Use dotBackgroundStatefulColor.defaultColor.")
    public var dotBackgroundColor: ColorToken {
        get { dotBackgroundStatefulColor.defaultColor }
        set { dotBackgroundStatefulColor.defaultColor = newValue }
    }

    @available(*, deprecated, message: "Use dotBackgroundStatefulColor.selectedColor.")
    public var dotBackgroundColorActivated: ColorToken {
        get { dotBackgroundStatefulColor.selectedColor }
        set { dotBackgroundStatefulColor.selectedColor = newValue }
    }

    public init() {}

    public init(
        size: PaginationDotsSizeConfiguration,
        dotBackgroundColor: ColorToken = .clearColor,
        dotBackgroundColorActivated: ColorToken = .clearColor,
        dotBackgroundStatefulColor: ButtonColor? = nil
    ) {
        self.size = size
        self.dotBackgroundColor = dotBackgroundColor
        self.dotBackgroundColorActivated = dotBackgroundColorActivated
        self.dotBackgroundStatefulColor = dotBackgroundStatefulColor ?? ButtonColor(
            defaultColor: dotBackgroundColor,
            selectedColor: dotBackgroundColorActivated
        )
    }

    
}

extension PaginationDotsAppearance: EnvironmentKey {
    public static var defaultValue: PaginationDotsAppearance {
        EnvironmentValueProvider.shared.value(forKey: PaginationDotsAppearance.self, fallback: PaginationDotsAppearance())
    }
}
