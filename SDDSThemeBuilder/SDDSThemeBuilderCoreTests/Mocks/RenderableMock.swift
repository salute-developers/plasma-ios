import Foundation
@testable import SDDSThemeBuilderCore

final class RenderableMock: Renderable {
    var stubbedResult: CommandResult = .empty
    
    func render(context: [String : Any], template: StencilTemplate) -> CommandResult {
        return stubbedResult
    }
}
