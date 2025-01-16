import Foundation
import Stencil

final class GenerateSwiftCodeCommand: Command, FileWriter {
    private let jsonURL: URL
    private let templates: [StencilTemplate]
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL,
         templates: [StencilTemplate],
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer()) {
        self.jsonURL = jsonURL
        self.templates = templates
        self.outputDirectoryURL = outputDirectoryURL
        self.templateRender = templateRender
        super.init(name: "Generate Swift Code")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()
        
        guard let jsonData = try? Data(contentsOf: jsonURL) else {
            return .error(GeneralError.invalidFilename)
        }
        
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return .error(GeneralError.decoding)
        }
        
        for template in templates {
            let result = templateRender.render(context: jsonDictionary, template: template, removeLines: false)
            
            guard let generatedContent = result.asGenerated else {
                return result
            }
            
            let filename = template.rawValue + ".swift"
            let saveResult = saveFile(content: generatedContent, outputURL: outputDirectoryURL, filename: filename)
            
            if saveResult.isError {
                return saveResult
            }
        }
        
        return .success
    }
}
