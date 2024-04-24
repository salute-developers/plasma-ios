import Foundation
import Stencil
import PathKit

final class GenerateTokensCommand: Command, FileWriter {
    private let schemeURL: URL
    private let templatesURL: URL
    private let template: StencilTemplate
    private let generatedOutputURL: URL
    private let templateRender: Renderable
    private let contextBuilder: ContexBuilder
    
    init(name: String,
         schemeURL: URL,
         templatesURL: URL,
         template: StencilTemplate,
         generatedOutputURL: URL,
         templateRender: Renderable = TemplateRenderer(),
         contextBuilder: ContexBuilder = GeneralContextBuilder()
    ) {
        self.schemeURL = schemeURL
        self.templatesURL = templatesURL
        self.template = template
        self.generatedOutputURL = generatedOutputURL
        self.templateRender = templateRender
        self.contextBuilder = contextBuilder
        
        super.init(name: name)
    }
    
    @discardableResult override func run() -> CommandResult {
        super.run()
        
        guard let jsonData = try? Data(contentsOf: schemeURL) else {
            return .error(GeneralError.invalidFilename)
        }
        
        var result = contextBuilder.buildContext(from: jsonData)
        guard let context = result.asDictionary else {
            return result
        }
        
        result = templateRender.render(context: context, template: template, templatesURL: templatesURL)
        guard let generatedContent = result.asGenerated else {
            return result
        }
        
        return saveFile(
            content: generatedContent,
            outputURL: generatedOutputURL,
            filename: template.filename
        )
    }
}
