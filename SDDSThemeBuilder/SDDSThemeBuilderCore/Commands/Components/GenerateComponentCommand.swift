import Foundation
import Stencil

/// Источник конфигов компонентов. Резолвит конфиг:
/// 1) локальный файл рядом с ThemeBuilder (напр. `carousel_config.json`),
/// 2) per-theme из theme-converter (`components/<scheme>/<file>`).
/// Конфиги binding'ов (form_item и т.п.) берутся из theme-converter per-theme —
/// у каждой темы там свой конфиг. `localDirectory` ставится в `App.run()`.
enum ComponentConfigSource {
    static var localDirectory: URL?

    static func data(
        for component: CodeGenerationComponent,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration
    ) -> Data? {
        if let localDirectory = localDirectory,
           let data = try? Data(contentsOf: localDirectory.appending(component: component.configurationFilename)) {
            return data
        }
        let scheme = themeConfig.url.deletingLastPathComponent().lastPathComponent
        let remoteBase = URL(string: ThemeBuilderConfiguration.Theme.baseURL)?
            .deletingLastPathComponent()
            .appending(component: "components")
            .appending(component: scheme)
        guard let remoteBase = remoteBase else { return nil }
        return try? Data(contentsOf: component.url(baseURL: remoteBase))
    }
}

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
        
        // Приоритет — per-theme локальный конфиг, затем общий локальный, иначе удалённый.
        guard let jsonData = ComponentConfigSource.data(for: component, themeConfig: themeConfig) else {
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
