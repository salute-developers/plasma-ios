import Foundation
import Stencil
import PathKit

final class TemplateRenderer: Renderable {
    func render(context: [String: Any], template: StencilTemplate, templatesURL: URL) -> CommandResult {
        let templatesPath = templatesURL.path()
        let stencilEnvironment = Environment(loader: FileSystemLoader(paths: [Path(templatesPath)]))
        guard let template = try? stencilEnvironment.loadTemplate(name: template.rawValue) else {
            return .error(CodeGenerationError.templateLoadingFailed)
        }
        
        // Генерация Swift файла
        guard let rendered = try? template.render(context) else {
            return .error(CodeGenerationError.renderingFailed)
        }
        
        return .generated(rendered)
    }
}
