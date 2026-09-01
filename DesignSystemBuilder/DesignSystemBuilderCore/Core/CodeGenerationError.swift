import Foundation

public enum CodeGenerationError: Error, Equatable {
    case templateLoadingFailed
    case renderingFailed
    case invalidData
    case fileManager(Error)
}

public func == (lhs: CodeGenerationError, rhs: CodeGenerationError) -> Bool {
    switch (lhs, rhs) {
    case (.templateLoadingFailed, .templateLoadingFailed),
         (.renderingFailed, .renderingFailed),
         (.invalidData, .invalidData):
        return true
    case (.fileManager(let lhsError), .fileManager(let rhsError)):
        return lhsError.localizedDescription == rhsError.localizedDescription
    default:
        return false
    }
}
