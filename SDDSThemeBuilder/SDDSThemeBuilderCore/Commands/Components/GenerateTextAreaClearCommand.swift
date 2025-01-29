import Foundation
import Stencil

final class GenerateTextAreaClearCommand: Command, FileWriter {
    private let jsonURL: URL
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL = URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_area_clear_config.json")!,
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
            let configuration = try decoder.decode(TextFieldConfiguration.self, from: jsonData)
            let builder = TextFieldContextBuilder(configuration: configuration)
            let context = builder.build()
            let inputs: [CodeGenerationInput] = [
                .init(template: .textAreaClearSize, configuration: context.sizeConfiguration),
                .init(template: .textAreaClearTypography, configuration: context.typography),
                .init(template: .textAreaClearSizeVariations, configuration: context.sizeConfiguration),
                .init(template: .textAreaClearColorVariations, configuration: context.appearance)
            ]
            return generate(inputs: inputs)
        } catch {
            print(error)
            return .error(GeneralError.decoding)
        }
    }
}
