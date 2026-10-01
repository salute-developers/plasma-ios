import Foundation
import Stencil

/// Источник конфигов компонентов. Резолвит конфиг:
/// 1) пакет компонентов дизайн-системы в `.sdds/components`, который наполняет DS Builder CLI,
/// 2) локальный файл рядом с dsbuilder (напр. `carousel_config.json`),
/// 3) per-theme из theme-converter (`components/<scheme>/<file>`).
///
/// Порядок зеркалит Android: там `.sdds/components` — источник по умолчанию, а скачивание
/// пакета остаётся только для тем с явно заданным source. Конфиги binding'ов (form_item и т.п.)
/// у тем без локального пакета по-прежнему приезжают из theme-converter.
/// `localDirectory` ставится в `App.run()`.
enum ComponentConfigSource {
    static var localDirectory: URL?

    /// Имя директории пакета компонентов внутри `.sdds`.
    static let sddsComponentsDirectoryName = "components"

    private static var cache: [String: Data?] = [:]

    static func data(
        for component: CodeGenerationComponent,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
    ) -> Data? {
        data(filename: component.configurationFilename(themeConfig: themeConfig), themeConfig: themeConfig)
    }

    static func data(
        filename: String,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
    ) -> Data? {
        let key = "\(themeConfig.name).\(filename)"
        if let cached = cache[key] { return cached }
        let data = load(filename: filename, themeConfig: themeConfig)
        cache[key] = data
        return data
    }

    /// Пакет компонентов дизайн-системы рядом с `config.json`, если тема описана локальной `.sdds`.
    static func sddsComponentsDirectory(
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
    ) -> URL? {
        guard let sddsConfigPath = themeConfig.sddsConfigPath else { return nil }
        let directory = URL(fileURLWithPath: sddsConfigPath)
            .deletingLastPathComponent()
            .appending(component: sddsComponentsDirectoryName)
        var isDirectory: ObjCBool = false
        guard FileManager.default.fileExists(atPath: directory.path(), isDirectory: &isDirectory),
              isDirectory.boolValue else {
            return nil
        }
        return directory
    }

    private static func load(
        filename: String,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
    ) -> Data? {
        if let sddsComponents = sddsComponentsDirectory(themeConfig: themeConfig),
           let data = try? Data(contentsOf: sddsComponents.appending(component: filename)) {
            return data
        }
        if let localDirectory = localDirectory,
           let data = try? Data(contentsOf: localDirectory.appending(component: filename)) {
            return data
        }
        let scheme = themeConfig.url.deletingLastPathComponent().lastPathComponent
        let remoteBase = URL(string: DesignSystemBuilderConfiguration.Theme.baseURL)?
            .deletingLastPathComponent()
            .appending(component: "components")
            .appending(component: scheme)
        guard let remoteBase = remoteBase else { return nil }
        return try? Data(contentsOf: remoteBase.appending(component: filename))
    }
}

final class GenerateComponentCommand<Props: MergeableConfiguration, Appearance: CodeGenerationAppearance, Size: CodeGenerationSize>: Command, FileWriter {
    private let outputDirectoryURL: URL
    private let templateRender: Renderable
    private let component: CodeGenerationComponent
    private let themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration

    init(component: CodeGenerationComponent,
         outputDirectoryURL: URL,
         templateRender: Renderable = TemplateRenderer(),
         themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
        self.component = component
        self.outputDirectoryURL = outputDirectoryURL
        self.templateRender = templateRender
        self.themeConfig = themeConfig
        
        super.init(name: "Generate \(themeConfig.name)Theme.\(component.rawValue) component")
    }

    @discardableResult override func run() -> CommandResult {
        super.run()

        UniversalRuntime.currentComponent = component
        ComponentStyleCatalog.reset(themeConfig: themeConfig)

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
