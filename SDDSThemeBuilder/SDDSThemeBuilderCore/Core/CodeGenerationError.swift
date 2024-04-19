import Foundation

enum CodeGenerationError: Error {
    case templateLoadingFailed
    case renderingFailed
    case invalidData
    case fileManager(Error)
}
