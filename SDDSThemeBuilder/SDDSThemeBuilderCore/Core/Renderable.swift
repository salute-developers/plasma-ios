import Foundation

protocol Renderable {
    func render(context: [String: Any], template: StencilTemplate, templatesURL: URL) -> CommandResult
}
