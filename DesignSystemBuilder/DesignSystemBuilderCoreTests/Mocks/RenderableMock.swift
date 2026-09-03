import Foundation
@testable import DesignSystemBuilderCore

final class RenderableMock: Renderable {
    var stubbedResult: CommandResult = .empty

    func render(context: [String: Any], template: DesignSystemBuilderCore.StencilTemplate, removeLines: Bool) -> DesignSystemBuilderCore.CommandResult {
        return stubbedResult
    }
}
