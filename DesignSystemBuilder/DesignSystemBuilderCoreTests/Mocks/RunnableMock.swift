import Foundation
@testable import DesignSystemBuilderCore

final class RunnableMock: Runnable {
    var stubbedResult: CommandResult = .empty
    
    func run() -> CommandResult {
        return stubbedResult
    }
}
