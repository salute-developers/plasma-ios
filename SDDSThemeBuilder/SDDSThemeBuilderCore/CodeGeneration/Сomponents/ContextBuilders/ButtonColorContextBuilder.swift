import Foundation

final class ButtonColorContextBuilder: CodeGenerationContextBuilder {
    enum OutputType {
        case buttonColor
        case statefulColor
    }

    private let defaultColor: ColorKeyValue?
    private let highlightedColor: ColorState?
    private let hoveredColor: ColorState?
    private let selectedColor: ColorState?
    private let statefulSource: ColorKeyValue?
    private let outputType: OutputType
    
    init(
        defaultColor: ColorKeyValue?,
        highlightedColor: ColorState?,
        hoveredColor: ColorState?,
        selectedColor: ColorState? = nil,
        outputType: OutputType = .buttonColor
    ) {
        self.defaultColor = defaultColor
        self.highlightedColor = highlightedColor
        self.hoveredColor = hoveredColor
        self.selectedColor = selectedColor
        self.statefulSource = nil
        self.outputType = outputType
    }

    init(statefulColor: ColorKeyValue?, outputType: OutputType = .buttonColor) {
        self.defaultColor = nil
        self.highlightedColor = nil
        self.hoveredColor = nil
        self.selectedColor = nil
        self.statefulSource = statefulColor
        self.outputType = outputType
    }
    
    var context: String? {
        if defaultColor == nil && highlightedColor == nil && hoveredColor == nil && statefulSource == nil {
            return nil
        }
        
        let clearColor = "ColorToken.clearColor"
        if let statefulSource {
            let defaultToken = ColorTokenContextBuilder(statefulSource, hasDefault: true).context ?? clearColor
            let values = statefulSource.states?.compactMap(statefulItemContext) ?? []
            return buildStatefulColorContext(defaultToken: defaultToken, values: values)
        }

        let defaultToken = ColorTokenContextBuilder(defaultColor, hasDefault: true).context ?? clearColor
        var values = [String]()
        if let highlighted = stateItemContext(highlightedColor, explicitState: "InteractiveState.pressed") {
            values.append(highlighted)
        }
        if let hovered = stateItemContext(hoveredColor, explicitState: "InteractiveState.hovered") {
            values.append(hovered)
        }
        if let selected = stateItemContext(selectedColor, explicitState: "InteractiveState.selected") {
            values.append(selected)
        }
        return buildStatefulColorContext(defaultToken: defaultToken, values: values)
    }

    private func buildStatefulColorContext(defaultToken: String, values: [String]) -> String {
        let valuesContext: String
        if values.isEmpty {
            valuesContext = "[]"
        } else {
            valuesContext = "[\n            \(values.joined(separator: ",\n            "))\n        ]"
        }
        let statefulColorContext = "StatefulColor(defaultValue: \(defaultToken), values: \(valuesContext))"
        switch outputType {
        case .buttonColor:
            return "ButtonColor(\(statefulColorContext))"
        case .statefulColor:
            return statefulColorContext
        }
    }

    private func statefulItemContext(_ state: ColorState) -> String? {
        guard let colorToken = ColorTokenContextBuilder(state, hasDefault: false).context else {
            return nil
        }
        let stateCases = state.state?.map { "InteractiveState.\($0.rawValue)" } ?? []
        let stateContext = stateCases.isEmpty ? "[]" : "[\(stateCases.joined(separator: ", "))]"
        return ".init(states: \(stateContext), value: \(colorToken))"
    }

    private func stateItemContext(_ state: ColorState?, explicitState: String) -> String? {
        guard let state, let colorToken = ColorTokenContextBuilder(state, hasDefault: false).context else {
            return nil
        }
        return ".init(states: [\(explicitState)], value: \(colorToken))"
    }
}
