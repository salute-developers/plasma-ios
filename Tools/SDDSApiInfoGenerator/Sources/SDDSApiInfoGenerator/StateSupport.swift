import Foundation

/// Словарь читается из исходников runtime и генератора, без копии списка состояний.
struct StateSupport: Codable, Equatable {
    let interactionStates: [String]
    let combinations: Bool

    static func load(runtimeSource: String, generatorSource: String) throws -> StateSupport {
        let table = SymbolTable()
        table.ingest(source: runtimeSource)
        table.ingest(source: generatorSource)
        guard let runtime = table.types["InteractiveState"], !runtime.enumCases.isEmpty,
              let generator = table.types["ComponentState"], !generator.enumCases.isEmpty else {
            throw StateSupportError.missingEnums
        }
        let runtimeCases = Dictionary(uniqueKeysWithValues: runtime.enumCases.map { ($0.rawValue ?? $0.name, $0.name) })
        for entry in generator.enumCases {
            guard runtimeCases[entry.rawValue ?? entry.name] == entry.name else {
                throw StateSupportError.unsupportedState(entry.name)
            }
        }
        guard let interactions = runtime.interactionStates, !interactions.isEmpty,
              Set(interactions).count == interactions.count else {
            throw StateSupportError.missingInteractionStates
        }
        let runtimeByName = Dictionary(uniqueKeysWithValues: runtime.enumCases.map { ($0.name, $0.rawValue ?? $0.name) })
        let names = try interactions.map { name -> String in
            guard let rawName = runtimeByName[name], generator.enumCases.contains(where: { $0.name == name }) else {
                throw StateSupportError.unsupportedState(name)
            }
            return rawName
        }
        return StateSupport(interactionStates: names, combinations: true)
    }
}

enum StateSupportError: LocalizedError {
    case missingEnums
    case missingInteractionStates
    case unsupportedState(String)

    var errorDescription: String? {
        switch self {
        case .missingEnums: return "Expected InteractiveState and ComponentState declarations."
        case .missingInteractionStates: return "InteractiveState must declare a non-empty, unique interactionStates array."
        case .unsupportedState(let name): return "State '\(name)' is not supported by both runtime and generator."
        }
    }
}
