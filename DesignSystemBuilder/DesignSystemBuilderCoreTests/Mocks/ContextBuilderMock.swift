import Foundation
@testable import DesignSystemBuilderCore

final class ContextBuilderMock: ContexBuilder {
    var stubbedResult: CommandResult = .empty
    
    func buildContext(from data: Data) -> CommandResult {
        stubbedResult
    }
}
