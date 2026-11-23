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
        return StateSupport(interactionStates: generator.enumCases.map { $0.rawValue ?? $0.name }, combinations: true)
    }
}

enum StateSupportError: Error {
    case missingEnums
    case unsupportedState(String)
}
