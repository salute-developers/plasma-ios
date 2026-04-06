import Foundation
import SwiftUI
@_exported import SDDSThemeCore

@available(*, deprecated, message: "Use StatefulColor instead.")
public struct ButtonColor: Hashable {
    public var defaultColor: ColorToken {
        didSet { rawStatefulColor = nil }
    }
    public var highlightedColor: ColorToken {
        didSet { rawStatefulColor = nil }
    }
    public var hoveredColor: ColorToken {
        didSet { rawStatefulColor = nil }
    }
    public var selectedColor: ColorToken {
        didSet { rawStatefulColor = nil }
    }
    
    private var rawStatefulColor: StatefulColor?

    public init(
        defaultColor: ColorToken = .clearColor,
        highlightedColor: ColorToken = .clearColor,
        hoveredColor: ColorToken = .clearColor,
        selectedColor: ColorToken = .clearColor
    ) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
        self.selectedColor = selectedColor
        self.rawStatefulColor = nil
    }

    public var statefulColor: StatefulColor {
        rawStatefulColor ?? StatefulColor(
            defaultValue: defaultColor,
            values: [
                .init(states: [InteractiveState.pressed], value: highlightedColor),
                .init(states: [InteractiveState.hovered], value: hoveredColor),
                .init(states: [InteractiveState.selected], value: selectedColor),
                .init(states: [InteractiveState.activated], value: selectedColor)
            ]
        )
    }

    public init(_ statefulColor: StatefulColor) {
        self.defaultColor = statefulColor.resolvedDefaultValue()
        self.highlightedColor = statefulColor.resolvedValue(for: Set([InteractiveState.pressed]))
        self.hoveredColor = statefulColor.resolvedValue(for: Set([InteractiveState.hovered]))
        let selectedValue = statefulColor.resolvedValue(for: Set([InteractiveState.selected]))
        let activatedValue = statefulColor.resolvedValue(for: Set([InteractiveState.activated]))
        self.selectedColor = selectedValue != defaultColor ? selectedValue : activatedValue
        self.rawStatefulColor = statefulColor
    }
}

public extension ButtonColor {
    func resolvedDefaultValue() -> ColorToken {
        statefulColor.resolvedDefaultValue()
    }

    func resolvedValue(for activeStates: Set<InteractiveState>) -> ColorToken {
        statefulColor.resolvedValue(for: activeStates)
    }

    func resolvedValue(for activeStates: Set<String>) -> ColorToken {
        statefulColor.resolvedValue(for: activeStates)
    }

    func color(
        for activeStates: Set<InteractiveState>,
        colorScheme: ColorScheme,
        subtheme: SubthemeData = SubthemeData()
    ) -> Color {
        statefulColor.color(for: activeStates, colorScheme: colorScheme, subtheme: subtheme)
    }
}

public extension SDDSThemeCore.StatefulColor {
    @available(*, deprecated, message: "Use StatefulColor(defaultValue:values:) with state entries instead.")
    init(
        defaultColor: ColorToken = .clearColor,
        highlightedColor: ColorToken = .clearColor,
        hoveredColor: ColorToken = .clearColor,
        selectedColor: ColorToken = .clearColor
    ) {
        self.init(
            defaultValue: defaultColor,
            values: [
                .init(states: [InteractiveState.pressed], value: highlightedColor),
                .init(states: [InteractiveState.hovered], value: hoveredColor),
                .init(states: [InteractiveState.selected], value: selectedColor)
            ]
        )
    }

    @available(*, deprecated, message: "Use resolvedValue(for:) with an explicit state set.")
    var defaultColor: ColorToken {
        resolvedDefaultValue()
    }

    @available(*, deprecated, message: "Use resolvedValue(for:) with an explicit state set.")
    var highlightedColor: ColorToken {
        resolvedValue(for: Set([InteractiveState.pressed]))
    }

    @available(*, deprecated, message: "Use resolvedValue(for:) with an explicit state set.")
    var hoveredColor: ColorToken {
        resolvedValue(for: Set([InteractiveState.hovered]))
    }

    @available(*, deprecated, message: "Use resolvedValue(for:) with an explicit state set.")
    var selectedColor: ColorToken {
        resolvedValue(for: Set([InteractiveState.selected]))
    }
}
