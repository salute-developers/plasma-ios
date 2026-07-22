import Foundation
import Stencil

public final class App {
    let config: ThemeBuilderConfiguration
    let sourcePath: String
    let outputPath: String?
    /// Автономный режим: собрать плоскую папку исходников токенов (`<Name>ThemeSources`)
    /// без линковки библиотек (см. `StandaloneBundle`).
    let standalone: Bool
    /// Путь к исходникам `SDDSThemeCore` для встраивания (флаг `--core-sources`);
    /// `nil` → repo-relative от `#file`.
    let coreSourcesPath: String?
    /// Дополнительно встроить компонентный слой (`--components`) — вариации
    /// компонентов темы + вендоренные `SDDSComponents`/`InputMask`/`SDDSIcons`.
    let includeComponents: Bool
    /// Директория для автономного бандла (`--standalone-output`); `nil` → дефолт
    /// `SDDSThemeBuilder/build/standalone`.
    let standaloneOutputPath: String?
    /// Вендорить исходники внешних зависимостей (InputMask) в бандл (`--external-dependencies`).
    /// По умолчанию `false` — InputMask остаётся внешним (не копируется, `import` сохранён,
    /// клиент линкует модуль сам).
    let vendorExternalDependencies: Bool
    /// Корень, относительно которого standalone берёт вендоримые исходники библиотек и
    /// пакет темы (`--sources-root`); `nil` → корень репозитория (запуск внутри plasma-ios).
    /// Позволяет запускать CLI вне репозитория, указав распакованную копию исходников.
    let sourcesRootPath: String?

    public init(
        config: ThemeBuilderConfiguration,
        sourcePath: String,
        outputPath: String? = nil,
        standalone: Bool = false,
        coreSourcesPath: String? = nil,
        includeComponents: Bool = false,
        standaloneOutputPath: String? = nil,
        vendorExternalDependencies: Bool = false,
        sourcesRootPath: String? = nil
    ) {
        self.config = config
        self.sourcePath = sourcePath
        self.outputPath = outputPath
        self.standalone = standalone
        self.coreSourcesPath = coreSourcesPath
        self.includeComponents = includeComponents
        self.standaloneOutputPath = standaloneOutputPath
        self.vendorExternalDependencies = vendorExternalDependencies
        self.sourcesRootPath = sourcesRootPath
    }

    /// Разрешённый источник темы. Зеркалит Android `ThemeSourceResolver`:
    /// явный source имеет приоритет, `.sdds` — fallback для тем, которые его не задают.
    private enum ResolvedSource {
        case explicit
        case sdds(SddsThemeSource)
    }

    private func executeCommands(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        PrepareDirectoriesCommand(
            themeBuilderURL: themeBuilderURL,
            outputDirectoryURL: outputDirectoryURL(config: themeConfig),
            themeURL: themeURL(config: themeConfig)
        ).run()

        switch resolveSource(themeConfig: themeConfig) {
        case .sdds(let sddsSource):
            executeSddsCommands(config: config, themeConfig: themeConfig, sddsSource: sddsSource)
        case .explicit:
            executeRemoteCommands(config: config, themeConfig: themeConfig)
        }

        if standalone {
            emitStandaloneBundle(themeConfig: themeConfig)
        }
    }

    /// Разрешает источник темы по семантике Android #815 (`explicit ?: sdds`):
    /// - тема без `sddsConfigPath` декларирует явный source (`url`/`localSchemePath`) → он побеждает;
    /// - тема с `sddsConfigPath` «не задаёт явный» → используется `.sdds`, а при недоступной/неполной
    ///   `.sdds`-директории происходит safety-fallback на remote/zip.
    private func resolveSource(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> ResolvedSource {
        guard themeConfig.sddsConfigPath != nil else {
            return .explicit
        }
        if let sddsSource = sddsThemeSource(themeConfig: themeConfig) {
            return .sdds(sddsSource)
        }
        Logger.printText("⚠️ .sdds недоступен для \(themeConfig.name) — fallback на remote/zip")
        return .explicit
    }

    // MARK: - Remote/zip flow

    private func executeRemoteCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration
    ) {
        DownloadCommand(fileURL: effectiveSchemeURL(themeConfig: themeConfig), outputURL: schemeZipLocalURL(themeConfig: themeConfig)).run()
        DownloadCommand(fileURL: config.paletteURL, outputURL: paletteLocalURL(config: config, themeConfig: themeConfig)).run()

        guard let schemeDirectory = UnpackThemeCommand(schemeURL: schemeZipLocalURL(themeConfig: themeConfig), outputDirectoryURL: outputDirectoryURL(config: themeConfig))
            .run()
            .asSchemeDirectory else {
            Logger.terminate("No scheme directory")
            return
        }

        let paletteURL = paletteLocalURL(config: config, themeConfig: themeConfig)
        generateBaseTheme(themeConfig: themeConfig, schemeDirectory: schemeDirectory, paletteURL: paletteURL)

        for tenant in themeConfig.tenants {
            Logger.printText("🎨 Generating tenant \(tenant.name) for \(themeConfig.name)...")
            executeTenantCommands(config: config, themeConfig: themeConfig, tenant: tenant)
        }
    }

    private func executeTenantCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        tenant: ThemeBuilderConfiguration.Tenant
    ) {
        let tenantOutputDirectory = self.tenantOutputDirectoryURL(config: themeConfig, tenant: tenant)
        try? FileManager.default.createDirectory(at: tenantOutputDirectory, withIntermediateDirectories: true)

        let tenantZipURL = tenantOutputDirectory.appending(component: tenant.url.lastPathComponent)
        DownloadCommand(fileURL: tenant.url, outputURL: tenantZipURL).run()

        guard let tenantSchemeDirectory = UnpackThemeCommand(schemeURL: tenantZipURL, outputDirectoryURL: tenantOutputDirectory)
            .run()
            .asSchemeDirectory else {
            Logger.terminate("No scheme directory for tenant \(tenant.name)")
            return
        }

        generateTenantTheme(
            themeConfig: themeConfig,
            schemeDirectory: tenantSchemeDirectory,
            paletteURL: paletteLocalURL(config: config, themeConfig: themeConfig),
            tenantSuffix: tenant.name,
            displayName: tenant.name
        )
    }

    // MARK: - Local `.sdds` flow

    /// Пытается прочитать локальный `.sdds`-источник темы. Возвращает nil, если у
    /// темы не задан `sddsConfigPath` либо `.sdds` отсутствует/неполон.
    private func sddsThemeSource(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> SddsThemeSource? {
        guard let relative = themeConfig.sddsConfigPath, !relative.isEmpty else {
            return nil
        }
        let configURL = repoRootURL.appending(path: relative)
        // Базовая директория — родитель папки `.sdds`; относительно неё
        // резолвятся пути из config.json (`.sdds/<tenant>`, `.sdds/tenants/palette.json`).
        let baseDirectory = configURL.deletingLastPathComponent().deletingLastPathComponent()
        return SddsThemeSourceReader(configURL: configURL, baseDirectory: baseDirectory).read()
    }

    private func executeSddsCommands(
        config: ThemeBuilderConfiguration,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        sddsSource: SddsThemeSource
    ) {
        Logger.printText("📦 Using local .sdds source for \(themeConfig.name) (base: \(sddsSource.baseName))")

        guard let baseTenant = sddsSource.tenants.first,
              let schemeDirectory = SchemeDirectory.make(fromUnpackedDirectory: baseTenant.directory) else {
            Logger.terminate("No scheme directory in .sdds for \(themeConfig.name)")
            return
        }

        generateBaseTheme(themeConfig: themeConfig, schemeDirectory: schemeDirectory, paletteURL: sddsSource.paletteURL)

        for tenant in sddsSource.tenants.dropFirst() {
            Logger.printText("🎨 Generating tenant \(tenant.displayName) for \(themeConfig.name)...")
            guard let tenantSchemeDirectory = SchemeDirectory.make(fromUnpackedDirectory: tenant.directory) else {
                Logger.terminate("No scheme directory in .sdds for tenant \(tenant.displayName)")
                return
            }
            generateTenantTheme(
                themeConfig: themeConfig,
                schemeDirectory: tenantSchemeDirectory,
                paletteURL: sddsSource.paletteURL,
                tenantSuffix: tenant.suffix,
                displayName: tenant.displayName
            )
        }
    }

    // MARK: - Shared generation

    private func generateBaseTheme(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        paletteURL: URL
    ) {
        guard let metaScheme = DecodeCommand<Scheme>(url: schemeDirectory.url(for: .meta))
            .run()
            .asScheme else {
            Logger.terminate("No scheme")
            return
        }

        guard let fontFamiliesContainer = DecodeCommand<FontFamiliesContainer>(url: schemeDirectory.url(for: .fontFamilies))
            .run()
            .asFontFamiliesContainer else {
            Logger.terminate("No font family container")
            return
        }

        var commands: [Command] = [
            InstallFontsCommand(
                fontFamiliesContainer: fontFamiliesContainer,
                fontsURL: fontsURL(config: themeConfig),
                copyFontsScriptURL: copyFontsScriptURL,
                registerFontsScriptURL: registerFontsScriptURL,
                sddsThemeBuilderXcodeProjectURL: xcodeProjectURL,
                themePlistURL: themePlistURL(config: themeConfig),
                fontFamilyOverride: themeConfig.fontFamilyOverride
            )
        ]
        commands.append(contentsOf: tokenCommands(
            themeConfig: themeConfig,
            schemeDirectory: schemeDirectory,
            metaScheme: metaScheme,
            fontFamiliesContainer: fontFamiliesContainer,
            paletteURL: paletteURL,
            tenantSuffix: nil
        ))
        // Обычный режим и standalone с компонентами генерят вариации компонентов;
        // standalone без компонентов (только токены) — пропускает их.
        if !standalone || includeComponents {
            commands.append(contentsOf: generateComponentVariations(themeConfig: themeConfig))
        }

        runCommands(commands)

        guard !standalone else { return }

        generateTokensMeta(
            themeConfig: themeConfig,
            schemeDirectory: schemeDirectory,
            metaScheme: metaScheme,
            paletteURL: paletteURL,
            fontFamiliesContainer: fontFamiliesContainer
        )
        generateBindingArtifacts(themeConfig: themeConfig, schemeDirectory: schemeDirectory)
    }

    private func generateTokensMeta(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        metaScheme: Scheme,
        paletteURL: URL,
        fontFamiliesContainer: FontFamiliesContainer
    ) {
        let resolver = TokenMetaResolver(
            namespace: "\(themeConfig.name)Theme",
            colorJson: resolvedTokenJson(ColorContextBuilder(paletteURL: paletteURL, metaScheme: metaScheme), url: schemeDirectory.url(for: .colors)),
            gradientJson: resolvedTokenJson(GradientContextBuilder(paletteURL: paletteURL, metaScheme: metaScheme), url: schemeDirectory.url(for: .gradients)),
            typographyJson: resolvedTokenJson(
                TypographyContextBuilder(fontFamiliesContainer: fontFamiliesContainer, metaScheme: metaScheme, fontFamilyOverride: themeConfig.fontFamilyOverride),
                url: schemeDirectory.url(for: .typography)
            ),
            shadowJson: resolvedTokenJson(GeneralContextBuilder(kind: .shadow, metaScheme: metaScheme), url: schemeDirectory.url(for: .shadows)),
            shapeJson: resolvedTokenJson(GeneralContextBuilder(kind: .shape, metaScheme: metaScheme), url: schemeDirectory.url(for: .shapes)),
            spacingJson: resolvedTokenJson(GeneralContextBuilder(kind: .spacing, metaScheme: metaScheme), url: schemeDirectory.url(for: .spacing))
        )

        let file = TokensMetaFile(
            name: metaScheme.name,
            version: metaScheme.version,
            tokens: resolver.entries(for: metaScheme.tokens)
        )
        writeTokensMeta(file, themeConfig: themeConfig)
    }

    private func resolvedTokenJson(_ builder: ContexBuilder, url: URL) -> [String: Any] {
        guard let data = try? Data(contentsOf: url) else { return [:] }
        return (builder.buildContext(from: data).asDictionary?["json"] as? [String: Any]) ?? [:]
    }

    /// Директория метаданных генерации темы — per-theme `.sdds`, рядом с пакетом темы
    /// (`Themes/<Name>Theme/.sdds` либо `<output>/<Name>Theme/.sdds`). Раньше писалось в
    /// общую `SDDSThemeBuilder/.sdds` и перезаписывалось на каждую тему.
    private func themeSddsURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: ".sdds")
    }

    private func writeTokensMeta(_ file: TokensMetaFile, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        let url = themeSddsURL(config: themeConfig)
            .appending(component: "config-info-tokens-ios.json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        guard let data = try? encoder.encode(file) else { return }
        try? FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: url)
        Logger.printText("📝 tokens meta written: \(url.path()) (\(file.tokens.count) tokens)")
    }

    // MARK: - Binding API (meta + styles collection)

    /// Генерирует binding API: для каждого компонента с `bindings` в конфиге —
    /// `<Component>+StylesCollection.swift`, и общий мета-файл `.sdds/config-info-ios.json`.
    private func generateBindingArtifacts(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory
    ) {
        var componentMetas: [ConfigInfo.ComponentMeta] = []

        // Компоненты с binding API (их конфиг содержит `bindings`). Конфиг темы
        // берётся per-theme из theme-converter; темы без такого компонента дают
        // 404 и просто пропускаются ниже.
        let components = CodeGenerationComponent.allCases.filter { $0.supportsBinding }

        for component in components {
            guard let raw = rawComponentConfig(component: component, themeConfig: themeConfig),
                  let bindings = raw.bindings, !bindings.isEmpty else {
                continue
            }
            let resolver = ComponentBindingResolver(
                component: component.rawValue,
                key: component.kebabKey,
                appearanceType: component.appearance,
                bindings: bindings,
                variations: (raw.variations ?? []).map {
                    .init(id: $0.id, parent: $0.parent, binding: $0.binding ?? [])
                }
            )
            guard let info = resolver.resolve(), !info.isEmpty else { continue }

            let outputURL = generatedComponentsURL(component: component, config: themeConfig)
            writeString(
                info.stylesCollectionSource(),
                to: outputURL,
                filename: "\(component.rawValue)+StylesCollection.swift"
            )
            componentMetas.append(info.componentMeta())
            Logger.printText("🔗 Binding API generated for \(component.rawValue) (\(info.styles.count) styles)")
        }

        let configInfo = ConfigInfo(
            name: themeConfig.name,
            packageName: themeConfig.name,
            tokens: tokenMetas(metaURL: schemeDirectory.url(for: .meta)),
            components: componentMetas
        )
        writeConfigInfo(configInfo, themeConfig: themeConfig)
    }

    /// Читает конфиг компонента только для binding-данных (per-theme резолв
    /// через `ComponentConfigSource`).
    private func rawComponentConfig(
        component: CodeGenerationComponent,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration
    ) -> RawComponentConfig? {
        guard let data = ComponentConfigSource.data(for: component, themeConfig: themeConfig) else {
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(RawComponentConfig.self, from: data)
    }

    private func tokenMetas(metaURL: URL) -> [ConfigInfo.TokenMeta] {
        struct RawMeta: Codable {
            struct Token: Codable {
                let id: String?
                let name: String
                let type: String?
                let tags: [String]?
            }
            let tokens: [Token]?
        }
        guard let data = try? Data(contentsOf: metaURL),
              let meta = try? JSONDecoder().decode(RawMeta.self, from: data) else {
            return []
        }
        return (meta.tokens ?? []).map { .init(id: $0.id, name: $0.name, type: $0.type, tags: $0.tags) }
    }

    private func writeString(_ content: String, to directory: URL, filename: String) {
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try? content.data(using: .utf8)?.write(to: directory.appending(component: filename))
    }

    private func writeConfigInfo(_ info: ConfigInfo, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        let url = themeSddsURL(config: themeConfig)
            .appending(component: "config-info-ios.json")
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        guard let data = try? encoder.encode(info) else { return }
        try? FileManager.default.createDirectory(at: url.deletingLastPathComponent(), withIntermediateDirectories: true)
        try? data.write(to: url)
        Logger.printText("📝 config-info written: \(url.path())")
    }

    private func generateTenantTheme(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        paletteURL: URL,
        tenantSuffix: String,
        displayName: String
    ) {
        guard let tenantMetaScheme = DecodeCommand<Scheme>(url: schemeDirectory.url(for: .meta))
            .run()
            .asScheme else {
            Logger.terminate("No scheme for tenant \(displayName)")
            return
        }

        guard let tenantFontFamiliesContainer = DecodeCommand<FontFamiliesContainer>(url: schemeDirectory.url(for: .fontFamilies))
            .run()
            .asFontFamiliesContainer else {
            Logger.terminate("No font family container for tenant \(displayName)")
            return
        }

        let commands = tokenCommands(
            themeConfig: themeConfig,
            schemeDirectory: schemeDirectory,
            metaScheme: tenantMetaScheme,
            fontFamiliesContainer: tenantFontFamiliesContainer,
            paletteURL: paletteURL,
            tenantSuffix: tenantSuffix
        )

        runCommands(commands)
    }

    /// Шесть `GenerateTokensCommand` (color/shadow/spacing/shape/typography/gradient),
    /// общие для базовой темы и tenant'ов, для remote- и `.sdds`-источников.
    /// `paletteURL` используется и палитрой рендерера, и context-builder'ами.
    private func tokenCommands(
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration,
        schemeDirectory: SchemeDirectory,
        metaScheme: Scheme,
        fontFamiliesContainer: FontFamiliesContainer,
        paletteURL: URL,
        tenantSuffix: String?
    ) -> [Command] {
        let label = tenantSuffix.map { " (\($0))" } ?? ""
        let renderer = { TemplateRenderer(paletteMapper: PaletteMapper(paletteURL: paletteURL)) }

        return [
            GenerateTokensCommand(
                name: "Generate Color Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .colors),
                themeURL: themeURL(config: themeConfig),
                templates: [.colorToken, .colors],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: ColorContextBuilder(
                    paletteURL: paletteURL,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shadow Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .shadows),
                themeURL: themeURL(config: themeConfig),
                templates: [.shadowToken, .shadows],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .shadow,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Spacing Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .spacing),
                themeURL: themeURL(config: themeConfig),
                templates: [.spacingToken, .spacings],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .spacing,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Shape Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .shapes),
                themeURL: themeURL(config: themeConfig),
                templates: [.shapeToken, .shapes],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GeneralContextBuilder(
                    kind: .shape,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Typography Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .typography),
                themeURL: themeURL(config: themeConfig),
                templates: [.typographyToken, .typographies],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: TypographyContextBuilder(
                    fontFamiliesContainer: fontFamiliesContainer,
                    metaScheme: metaScheme,
                    fontFamilyOverride: themeConfig.fontFamilyOverride
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            ),
            GenerateTokensCommand(
                name: "Generate Gradient Tokens\(label)",
                schemeURL: schemeDirectory.url(for: .gradients),
                themeURL: themeURL(config: themeConfig),
                templates: [.gradientToken, .gradients],
                generatedOutputURL: generatedTokensURL(config: themeConfig),
                templateRender: renderer(),
                contextBuilder: GradientContextBuilder(
                    paletteURL: paletteURL,
                    metaScheme: metaScheme
                ),
                themeName: themeConfig.name,
                tenantSuffix: tenantSuffix
            )
        ]
    }

    private func runCommands(_ commands: [Command]) {
        for command in commands {
            let result = command.run()
            switch result {
            case .error(let error):
                switch error {
                case .schemeNotFound:
                    Logger.printText(command.name + " skipped because no corresponding scheme found. Skipping... ⏭️⚠️")
                    continue
                default:
                    break
                }
                Logger.terminate(with: error)
            default:
                break
            }
        }
    }
}

// MARK: - Variations
extension App {
    private func generateComponentVariations(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> [Command] {
        CodeGenerationComponent.supportedComponents.map { component in
            return component.command(outputURL: generatedComponentsURL(component: component, config: themeConfig), themeConfig: themeConfig)
        }
    }
}

// MARK: - Directories
extension App {
    private var themeBuilderURL: URL {
        let path = URL(fileURLWithPath: sourcePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return path
    }

    /// Корень репозитория (`plasma-ios`). Используется для резолва
    /// `ThemeConfiguration.localSchemePath` и `sddsConfigPath`, которые хранятся
    /// как пути относительно корня репо.
    private var repoRootURL: URL {
        themeBuilderURL.deletingLastPathComponent()
    }

    /// URL, который `DownloadCommand` использует для получения схемы темы:
    /// либо `file://`-URL локального snapshot'а (если у темы задан
    /// `localSchemePath`), либо upstream-URL из конфига. Это позволяет
    /// отдельным темам собираться без сетевых обращений к стороннему репо схем.
    private func effectiveSchemeURL(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        if let relative = themeConfig.localSchemePath, !relative.isEmpty {
            return repoRootURL.appending(path: relative)
        }
        return themeConfig.url
    }

    private func outputDirectoryURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeBuilderURL
            .appending(component: "Output")
            .appending(component: config.name)
    }

    private func tenantOutputDirectoryURL(
        config: ThemeBuilderConfiguration.ThemeConfiguration,
        tenant: ThemeBuilderConfiguration.Tenant
    ) -> URL {
        outputDirectoryURL(config: config)
            .appending(component: "tenants")
            .appending(component: tenant.name)
    }

    private var xcodeProjectURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilder.xcodeproj")
    }

    private var templatesURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Stencil")
    }

    private func schemeZipLocalURL(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig)
            .appending(component: themeConfig.url.lastPathComponent)
    }

    private func paletteLocalURL(config: ThemeBuilderConfiguration, themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig).appending(component: config.paletteURL.lastPathComponent)
    }

    private func generatedTokensURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Tokens")
    }

    private func generatedComponentsURL(component: CodeGenerationComponent, config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: component.rawValue)
    }

    private func fontsURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Fonts")
    }

    private var copyFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/copyFonts.rb")
    }

    private var registerFontsScriptURL: URL {
        themeBuilderURL.appending(component: "SDDSThemeBuilderCore/Fonts/registerFonts.rb")
    }

    private func themePlistURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "info.plist")
    }

    private func themeURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        if let outputPath = outputPath, !outputPath.isEmpty {
            return URL(fileURLWithPath: outputPath, isDirectory: true)
                .appending(component: "\(config.name)Theme")
        }
        // В standalone-режиме без -o токены — промежуточный артефакт для сборки бандла,
        // поэтому пишем в build-scratch, а не перезаписываем закоммиченные Themes/*.
        if standalone {
            return themeBuilderURL
                .appending(path: "build/standalone-work")
                .appending(component: "\(config.name)Theme")
        }
        return themeBuilderURL.appending(component: "../Themes/\(config.name)Theme")
    }

    /// Корень вендоримых исходников: `--sources-root` либо корень репозитория. От него
    /// резолвятся исходники библиотек и пакет темы. Позволяет запускать CLI вне репо,
    /// указав распакованную копию исходников (напр. артефакт релиза).
    private var sourcesRootURL: URL {
        if let sourcesRootPath = sourcesRootPath, !sourcesRootPath.isEmpty {
            return URL(fileURLWithPath: sourcesRootPath, isDirectory: true)
        }
        return repoRootURL
    }

    /// Исходники `SDDSThemeCore` для встраивания: путь из `--core-sources`, иначе — от
    /// `sourcesRootURL` (по умолчанию корень репо).
    private var themeCoreSourcesURL: URL {
        if let coreSourcesPath = coreSourcesPath, !coreSourcesPath.isEmpty {
            return URL(fileURLWithPath: coreSourcesPath, isDirectory: true)
        }
        return sourcesRootURL.appending(path: "SDDSThemeBuilder/SDDSThemeCore/Sources/SDDSThemeCore")
    }

    /// Базовая директория для автономных бандлов: `--standalone-output` либо дефолт
    /// `SDDSThemeBuilder/build/standalone`.
    private var standaloneOutputBaseURL: URL {
        if let standaloneOutputPath = standaloneOutputPath, !standaloneOutputPath.isEmpty {
            return URL(fileURLWithPath: standaloneOutputPath, isDirectory: true)
        }
        return themeBuilderURL.appending(path: "build/standalone")
    }

    /// Папка автономных исходников темы (`<base>/<Name>ThemeSources`). Не зависит от
    /// `-o`: место бандла задаётся `--standalone-output` (по умолчанию `build/standalone`).
    private func standaloneBundleURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        standaloneOutputBaseURL.appending(component: "\(config.name)ThemeSources")
    }

    /// Исходники `SDDSComponents` (от `sourcesRootURL`; для компонентного слоя).
    private var componentsSourcesURL: URL {
        sourcesRootURL.appending(path: "SDDSComponents/Sources/SDDSComponents")
    }

    /// Библиотечные исходники `InputMask` (от `sourcesRootURL`; для компонентного слоя).
    private var inputMaskSourcesURL: URL {
        sourcesRootURL.appending(path: "Vendor/InputMask/Source/InputMask/InputMask/Classes")
    }

    /// Сгенерированный swiftgen `Asset` иконок (от `sourcesRootURL`; для компонентного слоя).
    private var iconsAssetsSwiftURL: URL {
        sourcesRootURL.appending(path: "SDDSIcons/Generated/Assets.swift")
    }

    /// Каталоги `Assets.xcassets`, копируемые в компонентный слой (иконки + ресурсы компонентов).
    private var componentXcassetsDirs: [URL] {
        [
            sourcesRootURL.appending(path: "SDDSIcons/SDDSIcons/Assets.xcassets"),
            sourcesRootURL.appending(path: "SDDSComponents/Assets.xcassets")
        ]
    }

    /// Пакет темы (`Themes/<Name>Theme`) — источник вариаций компонентов и `DefaultValues`
    /// для компонентного слоя. Берётся от `sourcesRootURL` (по умолчанию — из репозитория).
    private func themePackageDir(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        sourcesRootURL.appending(path: "Themes/\(config.name)Theme")
    }

    /// `EnvironmentValueProvider+DefaultValues.swift` из пакета темы.
    private func defaultValuesURL(config: ThemeBuilderConfiguration.ThemeConfiguration) -> URL {
        themePackageDir(config: config).appending(component: "EnvironmentValueProvider+DefaultValues.swift")
    }

    /// Собирает автономную плоскую папку исходников темы рядом с `themeURL`.
    /// Без компонентов — только токены; с `includeComponents` — плюс компонентный слой.
    private func emitStandaloneBundle(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) {
        let bundleDir = standaloneBundleURL(config: themeConfig)
        var bundle = StandaloneBundle(
            bundleDir: bundleDir,
            tokensDir: generatedTokensURL(config: themeConfig),
            fontsManifestURL: fontsURL(config: themeConfig).appending(component: "FontsManifest.swift"),
            coreSourcesURL: themeCoreSourcesURL,
            themeName: "\(themeConfig.name)Theme",
            registryKey: themeConfig.name
        )
        if includeComponents {
            bundle.includeComponents = true
            bundle.vendorExternalDependencies = vendorExternalDependencies
            bundle.componentsSourcesURL = componentsSourcesURL
            bundle.inputMaskSourcesURL = inputMaskSourcesURL
            bundle.iconsAssetsSwiftURL = iconsAssetsSwiftURL
            bundle.xcassetsDirs = componentXcassetsDirs
            // Полный набор взаимозависимых вариаций компонентов + регистрация appearance —
            // из готового пакета темы. Совпадения имён namespace вариаций с типами
            // SDDSComponents разводит StandaloneBundle (themeRenames).
            bundle.componentThemeDir = themePackageDir(config: themeConfig)
            bundle.defaultValuesURL = defaultValuesURL(config: themeConfig)
        }
        let count = bundle.emit()
        let level = includeComponents ? "токены + компоненты" : "только токены"
        Logger.printText("📦 Standalone sources [\(level)]: \(bundleDir.path()) (\(count) files)")
    }
}

// MARK: - Runnable
extension App: Runnable {
    @discardableResult public func run() -> CommandResult {
        Logger.printLine()
        Logger.printText("⏰ Running SDDSThemeBuilder...")
        Logger.printLine()

        ComponentConfigSource.localDirectory = themeBuilderURL

        for themeConfig in config.themes {
            Logger.printText("🚀 Generating code for theme \(themeConfig.name)...")
            executeCommands(config: config, themeConfig: themeConfig)
        }

        Logger.printLine()
        return .empty
    }
}
