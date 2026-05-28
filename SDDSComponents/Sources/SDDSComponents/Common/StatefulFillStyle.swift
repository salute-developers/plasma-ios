import Foundation
@_exported import SDDSThemeCore

public typealias StatefulFillStyle = SDDSThemeCore.StatefulValue<FillStyle>

public extension SDDSThemeCore.StatefulValue where Value == FillStyle {
    func resolvedValue(for activeStates: Set<InteractiveState>) -> FillStyle {
        resolvedValue(for: Set(activeStates.map(\.stateKey)))
    }
}

public extension SDDSThemeCore.StatefulValue where Value == ColorToken {
    var statefulFillStyle: StatefulFillStyle {
        StatefulFillStyle(
            defaultValue: defaultValue.map(FillStyle.color),
            values: values.map { .init(states: $0.states, value: .color($0.value)) }
        )
    }
}

public extension ColorToken {
    var statefulColor: StatefulColor {
        StatefulColor(defaultValue: self, values: [])
    }
}
