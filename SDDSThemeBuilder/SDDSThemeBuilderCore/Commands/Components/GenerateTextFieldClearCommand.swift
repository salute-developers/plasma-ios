import Foundation
import Stencil

final class GenerateTextFieldClearCommand: Command, FileWriter {
    private let jsonURL: URL
    private let outputDirectoryURL: URL
    private let templateRender: Renderable

    init(jsonURL: URL = URL(string: "https://raw.githubusercontent.com/salute-developers/theme-converter/refs/heads/main/components/sdds_serv/text_field_config_clear.json")!,
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
            let configuration = try decoder.decode(TextFieldClearConfiguration.self, from: jsonData)
            let builder = TextFieldClearContextBuilder(configuration: configuration)
            let context = configuration.build()
            let inputs: [CodeGenerationInput] = [
                .init(template: .textFieldClearSize, configuration: context.sizeConfiguration),
                .init(template: .textFieldClearTypography, configuration: context.typography),
                .init(template: .textFieldClearSizeVariations, configuration: context.sizeConfiguration),
                .init(template: .textFieldClearColorVariations, configuration: context.appearance)
            ]
            return generate(inputs: inputs)
        } catch {
            print(error)
            return .error(GeneralError.decoding)
        }
    }
}
