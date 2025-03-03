import Foundation
import Stencil

final class GenerateComponentCommand<Props: MergeableConfiguration, Appearance: CodeGenerationAppearance, Size: CodeGenerationSize>: Command, FileWriter {
    private let outputDirectoryURL: URL
    private let templateRender: Renderable
    private let component: CodeGenerationComponent
    private let themeConfig: ThemeBuilderConfiguration.ThemeConfiguration

    init(component: CodeGenerationComponent,
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer(),
         themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        self.component = component
        self.outputDirectoryURL = outputDirectoryURL
        self.templateRender = templateRender
        self.themeConfig = themeConfig
        
        super.init(name: "Generate \(themeConfig.name)Theme.\(component.rawValue) component")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()
        
        let baseURL = URL(string: ThemeBuilderConfiguration.Theme.baseURL)?
            .deletingLastPathComponent()
            .appending(component: "components")
            .appending(component: themeConfig.url.deletingLastPathComponent().lastPathComponent)
        guard let baseURL = baseURL, let jsonData = try? Data(contentsOf: component.url(baseURL: baseURL)) else {
            return .error(GeneralError.schemeNotFound)
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
