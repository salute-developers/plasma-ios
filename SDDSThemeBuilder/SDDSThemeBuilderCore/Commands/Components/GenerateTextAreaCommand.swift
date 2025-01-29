import Foundation
import Stencil

final class GenerateTextAreaCommand: Command, FileWriter {
    private let jsonURL: URL
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL = URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_area_config.json")!,
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
            let configuration = try decoder.decode(TextAreaConfiguration.self, from: jsonData)
            let builder = TextAreaContextBuilder(configuration: configuration)
            let context = builder.build()
            let inputs: [CodeGenerationInput] = [
                .init(template: .textAreaSize, configuration: context.sizeConfiguration),
                .init(template: .textAreaTypography, configuration: context.typography),
                .init(template: .textAreaSizeVariations, configuration: context.sizeConfiguration),
                .init(template: .textAreaColorVariations, configuration: context.appearance)
            ]
            return generate(renderer: templateRender, inputs: inputs, outputURL: outputDirectoryURL, fileWriter: self)
        } catch {
            print(error)
            return .error(GeneralError.decoding)
        }
    }
}
