import Foundation
import SwiftUI
import SDDSThemeCore
import SDDSApiInfo

@ApiInfo(components: ["PaginationDotsHorizontal", "PaginationDotsVertical"])
public struct PaginationDotsAppearance {
    public var size: PaginationDotsSizeConfiguration = DefaultPaginationDotsSize()
    @ApiName("dotBackgroundColor")
    public var dotBackgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])

    @ApiIgnore
    @available(*, deprecated, message: "Use dotBackgroundColor with StatefulFillStyle states.")
    public var dotBackgroundStatefulColor: ButtonColor {
        ButtonColor(
            defaultColor: dotBackgroundColor.resolvedDefaultValue().representativeColorToken,
            selectedColor: dotBackgroundColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
        )
    }

    @ApiIgnore
    @available(*, deprecated, message: "Use dotBackgroundColor.resolvedValue(for: [.activated]).")
    public var dotBackgroundColorActivated: ColorToken {
        dotBackgroundColor.resolvedValue(for: Set([InteractiveState.activated])).representativeColorToken
    }

    public init() {}

    public init(
        size: PaginationDotsSizeConfiguration,
        dotBackgroundColor: StatefulFillStyle = StatefulFillStyle(defaultValue: .color(.clearColor), values: [])
    ) {
        self.size = size
        self.dotBackgroundColor = dotBackgroundColor
    }

    @available(*, deprecated, message: "ColorToken/ButtonColor are deprecated and will be replaced by StatefulFillStyle in a future release.")
    @_disfavoredOverload
    public init(
        size: PaginationDotsSizeConfiguration,
        dotBackgroundColor: ColorToken = .clearColor,
        dotBackgroundColorActivated: ColorToken = .clearColor,
        dotBackgroundStatefulColor: ButtonColor? = nil
    ) {
        let stateful = dotBackgroundStatefulColor ?? ButtonColor(
            defaultColor: dotBackgroundColor,
            selectedColor: dotBackgroundColorActivated
        )
        self.init(size: size, dotBackgroundColor: stateful.statefulColor.statefulFillStyle)
    }
}

extension PaginationDotsAppearance: EnvironmentKey {
    public static var defaultValue: PaginationDotsAppearance {
        EnvironmentValueProvider.shared.value(forKey: PaginationDotsAppearance.self, fallback: PaginationDotsAppearance())
    }
}
