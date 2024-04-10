import Foundation
@testable import SDDSThemeBuilderCore

final class RunnableMock: Runnable {
    var stubbedResult: CommandResult = .empty
    
    func run() -> CommandResult {
        return stubbedResult
    }
}
