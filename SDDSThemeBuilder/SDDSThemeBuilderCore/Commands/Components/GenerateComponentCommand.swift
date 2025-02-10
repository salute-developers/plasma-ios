import Foundation
import Stencil

final class GenerateComponentCommand<Props: MergeableConfiguration, Appearance: CodeGenerationAppearance, Size: CodeGenerationSize>: Command, FileWriter {
    private let outputDirectoryURL: URL
    private let templateRender: Renderable
    private let component: CodeGenerationComponent

    init(component: CodeGenerationComponent,
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer()) {
        self.component = component
        self.outputDirectoryURL = outputDirectoryURL
        self.templateRender = templateRender
        super.init(name: "Generate Swift Code")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()
        
        guard let jsonData = try? Data(contentsOf: component.url) else {
            return .error(GeneralError.invalidFilename)
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let configuration = try decoder.decode(ComponentConfiguration<Props>.self, from: jsonData)
            let builder = ComponentContextBuilderImpl<Props, Appearance, Size>(
                configuration: configuration,
                component: component
            )
            let context = builder.build()
            let inputs: [CodeGenerationInput] = [
                .init(template: .componentSize, component: component, configuration: context.size),
                .init(template: .componentTypography, component: component, configuration: context.typography),
                .init(template: .componentBaseVariations, component: component, configuration: context.base),
                .init(template: .componentVariations, component: component, configuration: context.variations)
            ]
            return generate(renderer: templateRender, inputs: inputs, outputURL: outputDirectoryURL, fileWriter: self)
        } catch {
            print(error)
            return .error(GeneralError.decoding)
        }
    }
}
