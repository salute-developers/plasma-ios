import Foundation
import SwiftUI
@_exported import SDDSThemeCore

public typealias StatefulFillStyle = SDDSThemeCore.StatefulValue<FillStyle>

public extension SDDSThemeCore.StatefulValue where Value == FillStyle {
    func resolvedValue(for activeStates: Set<InteractiveState>) -> FillStyle {
        resolvedValue(for: Set(activeStates.map(\.stateKey)))
    }

    /// Совместимость со старым `ColorToken`-API: репрезентативный цвет дефолтного значения.
    /// Для градиента возвращается его первый фоновый цвет (см. `FillStyle.representativeColor`).
    func color(for colorScheme: ColorScheme, subtheme: SubthemeData = SubthemeData()) -> Color {
        resolvedDefaultValue().representativeColor(for: colorScheme, subtheme: subtheme)
    }

    /// Совместимость со старым `ButtonColor`-API: репрезентативный цвет для набора состояний.
    func color(
        for activeStates: Set<InteractiveState>,
        colorScheme: ColorScheme,
        subtheme: SubthemeData = SubthemeData()
    ) -> Color {
        resolvedValue(for: activeStates).representativeColor(for: colorScheme, subtheme: subtheme)
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

    /// Удобное преобразование одиночного `ColorToken` в `StatefulFillStyle`.
    /// Позволяет писать `appearance.someColor = token.fill` вместо `token.statefulColor.statefulFillStyle`.
    var fill: StatefulFillStyle {
        statefulColor.statefulFillStyle
    }
}
