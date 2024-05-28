import Foundation
import Stencil
import PathKit

final class GenerateTokensCommand: Command, FileWriter {
    private let schemeURL: URL
    private let templatesURL: URL
    private let templates: [StencilTemplate]
    private let generatedOutputURL: URL
    private let templateRender: Renderable
    private let contextBuilder: ContexBuilder
    
    init(name: String,
         schemeURL: URL,
         templatesURL: URL,
         templates: [StencilTemplate],
         generatedOutputURL: URL,
         templateRender: Renderable = TemplateRenderer(),
         contextBuilder: ContexBuilder = GeneralContextBuilder()
    ) {
        self.schemeURL = schemeURL
        self.templatesURL = templatesURL
        self.templates = templates
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
        
        for template in templates {
            result = templateRender.render(context: context, template: template, templatesURL: templatesURL)
            guard let generatedContent = result.asGenerated else {
                return result
            }
            
            result = saveFile(
                content: generatedContent,
                outputURL: generatedOutputURL,
                filename: template.filename
            )
        }
        
        return result
    }
}
