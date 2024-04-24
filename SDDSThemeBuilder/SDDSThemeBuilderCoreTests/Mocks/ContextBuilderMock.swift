import Foundation
@testable import SDDSThemeBuilderCore

final class ContextBuilderMock: ContexBuilder {
    var stubbedResult: CommandResult = .empty
    
    func buildContext(from data: Data) -> CommandResult {
        stubbedResult
    }
}
