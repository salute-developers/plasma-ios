import Foundation
@testable import SDDSThemeBuilderCore

final class RenderableMock: Renderable {
    var stubbedResult: CommandResult = .empty
    
    func render(context: [String : Any], template: SDDSThemeBuilderCore.StencilTemplate, removeLines: Bool) -> SDDSThemeBuilderCore.CommandResult {
        return stubbedResult
    }
}
