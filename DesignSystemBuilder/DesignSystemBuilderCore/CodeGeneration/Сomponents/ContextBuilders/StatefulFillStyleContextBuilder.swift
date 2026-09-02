import Foundation

final class StatefulFillStyleContextBuilder: CodeGenerationContextBuilder {
    private let source: ColorKeyValue?
    private let hasDefault: Bool

    init(_ source: ColorKeyValue?, hasDefault: Bool = false) {
        self.source = source
        self.hasDefault = hasDefault
    }

    var context: String? {
        guard let source else {
            if hasDefault {
                return "StatefulFillStyle(defaultValue: .color(.clearColor), values: [])"
            }
            return nil
        }

        let defaultFillStyle = FillStyleContextBuilder(source, hasDefault: true).context ?? ".color(.clearColor)"
        let stateItems = source.states?.compactMap(stateContext) ?? []
        let valuesContext: String
        if stateItems.isEmpty {
            valuesContext = "[]"
        } else {
            valuesContext = "[\n            \(stateItems.joined(separator: ",\n            "))\n        ]"
        }
        return "StatefulFillStyle(defaultValue: \(defaultFillStyle), values: \(valuesContext))"
    }

    private func stateContext(_ state: ColorState) -> String? {
        let statefulSource = ColorKeyValue(type: source?.type, default: state.value, alpha: source?.alpha, states: nil)
        guard let fillStyleContext = FillStyleContextBuilder(statefulSource, hasDefault: false).context else {
            return nil
        }
        let states = state.state?.map { "InteractiveState.\($0.rawValue)" } ?? []
        let statesContext = states.isEmpty ? "[]" : "[\(states.joined(separator: ", "))]"
        return ".init(states: \(statesContext), value: \(fillStyleContext))"
    }
}
