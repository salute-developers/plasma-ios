import Foundation
import Stencil

final class GenerateTextFieldCommand: Command, FileWriter {
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
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        guard let textFieldConfiguration = try? decoder.decode(TextFieldConfiguration.self, from: jsonData) else {
            return .error(GeneralError.decoding)
        }
        
        let textFieldContextBuilder = TextFieldContextBuilder(configuration: textFieldConfiguration)
        let context = textFieldContextBuilder.build()
        
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(context.sizeConfiguration) else {
            return .error(GeneralError.decoding)
        }
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return .error(GeneralError.decoding)
        }
        
        for template in templates {
            let result = templateRender.render(context: jsonDictionary, template: template)
            
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
