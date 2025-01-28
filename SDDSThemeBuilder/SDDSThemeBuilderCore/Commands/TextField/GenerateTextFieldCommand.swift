import Foundation
import Stencil

final class GenerateTextFieldCommand: Command, FileWriter {
    private let jsonURL: URL
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL = URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_field_config.json")!,
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer()) {
        self.jsonURL = jsonURL
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
        
        do {
            let textFieldConfiguration = try decoder.decode(TextFieldConfiguration.self, from: jsonData)
            let textFieldContextBuilder = TextFieldContextBuilder(configuration: textFieldConfiguration)
            let context = textFieldContextBuilder.build()
            let inputs: [CodeGenerationInput] = [
                .init(template: .textFieldSize, configuration: context.sizeConfiguration),
                .init(template: .textFieldTypography, configuration: context.typography),
                .init(template: .textFieldSizeVariations, configuration: context.sizeConfiguration),
                .init(template: .textFieldColorVariations, configuration: context.appearance)
            ]
            for input in inputs {
                let result = generate(input: input)
                guard result == .success else {
                    return result
                }
            }
                    
            return .success
        } catch {
            print(error)
            return .error(GeneralError.decoding)
        }
    }
    
    private func generate(input: CodeGenerationInput) -> CommandResult {
        let encoder = JSONEncoder()
        guard let jsonData = try? encoder.encode(input.configuration) else {
            return .error(GeneralError.decoding)
        }
        guard let jsonDictionary = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else {
            return .error(GeneralError.decoding)
        }
        
        let result = templateRender.render(context: jsonDictionary, template: input.template, removeLines: false)
        
        guard let generatedContent = result.asGenerated else {
            return result
        }
        
        let filename = input.template.rawValue + ".swift"
        let saveResult = saveFile(content: generatedContent, outputURL: outputDirectoryURL, filename: filename)
        
        if saveResult.isError {
            return saveResult
        }
        
        return .success
    }

}
