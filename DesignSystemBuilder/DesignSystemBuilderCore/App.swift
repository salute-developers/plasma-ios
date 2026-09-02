import Foundation
import Stencil

public final class App {
    let config: DesignSystemBuilderConfiguration
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
    /// `DesignSystemBuilder/build/standalone`.
    let standaloneOutputPath: String?
    /// Вендорить исходники внешних зависимостей (InputMask) в бандл (`--external-dependencies`).
    /// По умолчанию `false` — InputMask остаётся внешним (не копируется, `import` сохранён,
    /// клиент линкует модуль сам).
    let vendorExternalDependencies: Bool
    /// Корень, относительно которого standalone берёт вендоримые исходники библиотек и
    /// пакет темы (`--sources-root`); `nil` → корень репозитория (запуск внутри plasma-ios).
    /// Позволяет запускать CLI вне репозитория, указав распакованную копию исходников.
    let sourcesRootPath: String?
    /// Версия исходников (тег релиза) для загрузки с GitHub Release (`--sources-version`).
    /// Задан → исходники скачиваются и распаковываются в `generationRootURL`, и уже
    /// распакованный корень используется вместо `sourcesRootPath`.
    let sourcesVersion: String?
    /// Явный URL архива исходников (`--sources-url`), в том числе `file://`.
    let sourcesArchiveURLString: String?
    /// GitHub-репозиторий с релизами (`owner/repo`) для `--sources-version`.
    let sourcesRepository: String?

    /// Корень исходников, распакованных из релизного архива. Заполняется один раз
    /// в `run()`, до генерации тем.
    private var fetchedSourcesRootURL: URL?

    public init(
        config: DesignSystemBuilderConfiguration,
        sourcePath: String,
        outputPath: String? = nil,
        standalone: Bool = false,
        coreSourcesPath: String? = nil,
        includeComponents: Bool = false,
        standaloneOutputPath: String? = nil,
        vendorExternalDependencies: Bool = false,
        sourcesRootPath: String? = nil,
        sourcesVersion: String? = nil,
        sourcesArchiveURLString: String? = nil,
        sourcesRepository: String? = nil
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
        self.sourcesVersion = sourcesVersion
        self.sourcesArchiveURLString = sourcesArchiveURLString
        self.sourcesRepository = sourcesRepository
    }

    /// Разрешённый источник темы. Зеркалит Android `ThemeSourceResolver`:
    /// явный source имеет приоритет, `.sdds` — fallback для тем, которые его не задают.
    private enum ResolvedSource {
        case explicit
        case sdds(SddsThemeSource)
    }

    private func executeCommands(config: DesignSystemBuilderConfiguration, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
        PrepareDirectoriesCommand(
            designSystemBuilderURL: designSystemBuilderURL,
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
    private func resolveSource(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> ResolvedSource {
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
        config: DesignSystemBuilderConfiguration,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
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
        config: DesignSystemBuilderConfiguration,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
        tenant: DesignSystemBuilderConfiguration.Tenant
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
    private func sddsThemeSource(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> SddsThemeSource? {
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
        config: DesignSystemBuilderConfiguration,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
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
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
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
                sddsDesignSystemBuilderXcodeProjectURL: xcodeProjectURL,
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
        // Вариации компонентов генерит только обычный режим. Standalone их не генерит:
        // компонентный слой бандла берётся из готового пакета темы (`themePackageDir`),
        // а свежая генерация здесь всё равно не использовалась бы и тянула бы
        // `ComponentConfigSource` от compile-time пути (ломает запуск вне репо).
        if !standalone {
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
        generateBindingArtifacts(themeConfig: themeConfig)
    }

    private func generateTokensMeta(
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
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
    /// общую `DesignSystemBuilder/.sdds` и перезаписывалось на каждую тему.
    private func themeSddsURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: ".sdds")
    }

    private func writeTokensMeta(_ file: TokensMetaFile, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
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
    private func generateBindingArtifacts(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
        var componentMetas: [ConfigInfo.ComponentMeta] = []

        // Мета config-info строится для ВСЕХ компонентов темы, чей конфиг содержит
        // `bindings`, — она описывает весь состав темы. Код binding-API
        // (`+StylesCollection.swift`) генерится только для опробованных
        // компонентов (`supportsBinding`), поэтому и `styleApi` в мете
        // заполняется только для них: иначе примеры в документации ссылались бы
        // на несуществующий тип `<Component>Styles`.
        // Конфиг темы берётся per-theme из theme-converter; темы без компонента
        // дают 404 и просто пропускаются ниже.
        for component in CodeGenerationComponent.allCases {
            guard let appearanceType = component.appearanceIfKnown,
                  let raw = rawComponentConfig(component: component, themeConfig: themeConfig),
                  let bindings = raw.bindings, !bindings.isEmpty else {
                continue
            }
            let resolver = ComponentBindingResolver(
                component: component.rawValue,
                key: component.kebabKey,
                appearanceType: appearanceType,
                bindings: bindings,
                variations: (raw.variations ?? []).map {
                    .init(id: $0.id, parent: $0.parent, binding: $0.binding ?? [])
                }
            )
            guard let info = resolver.resolve(), !info.isEmpty else { continue }

            if component.supportsBinding {
                let outputURL = generatedComponentsURL(component: component, config: themeConfig)
                writeString(
                    info.stylesCollectionSource(),
                    to: outputURL,
                    filename: "\(component.rawValue)+StylesCollection.swift"
                )
                Logger.printText("🔗 Binding API generated for \(component.rawValue) (\(info.styles.count) styles)")
            }
            componentMetas.append(info.componentMeta(includeStyleApi: component.supportsBinding))
        }

        let configInfo = ConfigInfo(
            name: themeConfig.name,
            packageName: themeConfig.name,
            components: componentMetas
        )
        writeConfigInfo(configInfo, themeConfig: themeConfig)
    }

    /// Читает конфиг компонента только для binding-данных (per-theme резолв
    /// через `ComponentConfigSource`).
    private func rawComponentConfig(
        component: CodeGenerationComponent,
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration
    ) -> RawComponentConfig? {
        guard let data = ComponentConfigSource.data(for: component, themeConfig: themeConfig) else {
            return nil
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try? decoder.decode(RawComponentConfig.self, from: data)
    }

    private func writeString(_ content: String, to directory: URL, filename: String) {
        try? FileManager.default.createDirectory(at: directory, withIntermediateDirectories: true)
        try? content.data(using: .utf8)?.write(to: directory.appending(component: filename))
    }

    private func writeConfigInfo(_ info: ConfigInfo, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
        let issues = ConfigInfoValidator.validate(info)
        guard issues.isEmpty else {
            Logger.terminate("config-info невалиден: \(issues.joined(separator: "; "))")
        }
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
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
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
        themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration,
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
                Logger.terminate("\(command.name) failed: \(error)")
            default:
                break
            }
        }
    }
}

// MARK: - Variations
extension App {
    func loadApiMeta() {
        guard !ApiMetaStore.shared.isLoaded else { return }
        let candidates = apiMetaCandidates
        for url in candidates where ApiMetaStore.shared.load(from: url) {
            Logger.printText("📐 Loaded styles API meta: \(ApiMetaStore.shared.byComponent.count) components")
            return
        }
        Logger.terminate("Styles API meta not found in \(candidates.map { $0.path() }.joined(separator: ", ")). In the repo run scripts/generate_api_meta.sh; a released CLI expects ios-api-meta.json next to the binary")
    }

    private var apiMetaCandidates: [URL] {
        var candidates = [designSystemBuilderURL.appending(component: ".sdds/ios-api-meta.json")]
        if let binaryDirectory = Bundle.main.executableURL?.resolvingSymlinksInPath().deletingLastPathComponent() {
            candidates.append(binaryDirectory.appending(component: "ios-api-meta.json"))
        }
        return candidates
    }

    private func generateComponentVariations(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> [Command] {
        let index = ComponentIndex.entries(themeConfig: themeConfig)
        let components = index.isEmpty
            ? CodeGenerationComponent.supportedComponents
            : CodeGenerationComponent.supportedComponents.filter { ComponentIndex.entry(for: $0, themeConfig: themeConfig) != nil }
        if !index.isEmpty {
            Logger.printText("🧩 \(themeConfig.name): \(components.count) of \(index.count) DS styles")
            let missing = ComponentIndex.notImplemented(themeConfig: themeConfig)
            if !missing.isEmpty {
                Logger.printText("   not implemented on iOS: \(missing.joined(separator: ", "))")
            }
        }
        return components.map { component in
            return component.command(outputURL: generatedComponentsURL(component: component, config: themeConfig), themeConfig: themeConfig)
        }
    }
}

// MARK: - Directories
extension App {
    private var designSystemBuilderURL: URL {
        let path = URL(fileURLWithPath: sourcePath)
            .deletingLastPathComponent()
            .deletingLastPathComponent()
        return path
    }

    /// Корень репозитория (`plasma-ios`). Используется для резолва
    /// `ThemeConfiguration.localSchemePath` и `sddsConfigPath`, которые хранятся
    /// как пути относительно корня репо.
    private var repoRootURL: URL {
        designSystemBuilderURL.deletingLastPathComponent()
    }

    /// URL, который `DownloadCommand` использует для получения схемы темы:
    /// либо `file://`-URL локального snapshot'а (если у темы задан
    /// `localSchemePath`), либо upstream-URL из конфига. Это позволяет
    /// отдельным темам собираться без сетевых обращений к стороннему репо схем.
    private func effectiveSchemeURL(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        if let relative = themeConfig.localSchemePath, !relative.isEmpty {
            return repoRootURL.appending(path: relative)
        }
        return themeConfig.url
    }

    /// Портируемый рабочий корень для скрэтча и промежуточных артефактов. НЕ зависит от
    /// compile-time пути (`#file`), поэтому бинарь работает на любой машине (в т.ч. у клиента),
    /// а не только в дереве сборки. Лежит в системном temp.
    private var workRootURL: URL {
        FileManager.default.temporaryDirectory.appending(path: "DesignSystemBuilder")
    }

    private func outputDirectoryURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        workRootURL
            .appending(component: "Output")
            .appending(component: config.name)
    }

    private func tenantOutputDirectoryURL(
        config: DesignSystemBuilderConfiguration.ThemeConfiguration,
        tenant: DesignSystemBuilderConfiguration.Tenant
    ) -> URL {
        outputDirectoryURL(config: config)
            .appending(component: "tenants")
            .appending(component: tenant.name)
    }

    private var xcodeProjectURL: URL {
        designSystemBuilderURL.appending(component: "DesignSystemBuilder.xcodeproj")
    }

    private var templatesURL: URL {
        designSystemBuilderURL.appending(component: "DesignSystemBuilderCore/Stencil")
    }

    private func schemeZipLocalURL(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig)
            .appending(component: themeConfig.url.lastPathComponent)
    }

    private func paletteLocalURL(config: DesignSystemBuilderConfiguration, themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        outputDirectoryURL(config: themeConfig).appending(component: config.paletteURL.lastPathComponent)
    }

    private func generatedTokensURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Tokens")
    }

    private func generatedComponentsURL(component: CodeGenerationComponent, config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: component.rawValue)
    }

    private func fontsURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "Fonts")
    }

    private var copyFontsScriptURL: URL {
        designSystemBuilderURL.appending(component: "DesignSystemBuilderCore/Fonts/copyFonts.rb")
    }

    private var registerFontsScriptURL: URL {
        designSystemBuilderURL.appending(component: "DesignSystemBuilderCore/Fonts/registerFonts.rb")
    }

    private func themePlistURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themeURL(config: config).appending(component: "info.plist")
    }

    /// Директория, в которую CLI складывает сгенерированные темы (`<name>Theme`), а с
    /// `--sources-version` — и распакованный архив исходников.
    private var generationRootURL: URL {
        if let outputPath = outputPath, !outputPath.isEmpty {
            return URL(fileURLWithPath: outputPath, isDirectory: true)
        }
        // В standalone-режиме без -o токены — промежуточный артефакт для сборки бандла,
        // поэтому пишем в портируемый work-scratch (а не в Themes/* и не в baked-путь).
        if standalone {
            return workRootURL.appending(path: "standalone-work")
        }
        return designSystemBuilderURL.appending(path: "../Themes")
    }

    private func themeURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        generationRootURL.appending(component: "\(config.name)Theme")
    }

    /// Корень вендоримых исходников, от которого резолвятся библиотеки и пакет темы.
    /// Приоритет: распакованный релизный архив (`--sources-version`) → `--sources-root`
    /// → корень репозитория. Позволяет запускать CLI вне репо.
    private var sourcesRootURL: URL {
        if let fetchedSourcesRootURL = fetchedSourcesRootURL {
            return fetchedSourcesRootURL
        }
        if let sourcesRootPath = sourcesRootPath, !sourcesRootPath.isEmpty {
            return URL(fileURLWithPath: sourcesRootPath, isDirectory: true)
        }
        return repoRootURL
    }

    /// Скачивает и распаковывает исходники запрошенной версии в `generationRootURL`.
    /// Вызывается один раз до генерации тем; дальше `sourcesRootURL` указывает на них.
    private func fetchSourcesIfNeeded() {
        guard let sourcesVersion = sourcesVersion, !sourcesVersion.isEmpty else { return }

        var fetcher = SourcesReleaseFetcher(version: sourcesVersion, destinationDirectory: generationRootURL)
        if let string = sourcesArchiveURLString, !string.isEmpty {
            fetcher.archiveURL = URL(string: string).flatMap { $0.scheme == nil ? nil : $0 }
                ?? URL(fileURLWithPath: string)
        }
        if let sourcesRepository = sourcesRepository, !sourcesRepository.isEmpty {
            fetcher.repository = sourcesRepository
        }
        fetchedSourcesRootURL = fetcher.resolve()
    }

    /// Исходники `SDDSThemeCore` для встраивания: путь из `--core-sources`, иначе — от
    /// `sourcesRootURL` (по умолчанию корень репо).
    private var themeCoreSourcesURL: URL {
        if let coreSourcesPath = coreSourcesPath, !coreSourcesPath.isEmpty {
            return URL(fileURLWithPath: coreSourcesPath, isDirectory: true)
        }
        return sourcesRootURL.appending(path: "DesignSystemBuilder/SDDSThemeCore/Sources/SDDSThemeCore")
    }

    /// Базовая директория для автономных бандлов: `--standalone-output` либо дефолт —
    /// текущая рабочая директория запуска (портируемо: клиент получает бандл рядом,
    /// а не в baked-пути сборки).
    private var standaloneOutputBaseURL: URL {
        if let standaloneOutputPath = standaloneOutputPath, !standaloneOutputPath.isEmpty {
            return URL(fileURLWithPath: standaloneOutputPath, isDirectory: true)
        }
        return URL(fileURLWithPath: FileManager.default.currentDirectoryPath, isDirectory: true)
            .appending(path: "SDDSStandalone")
    }

    /// Папка автономных исходников темы (`<base>/<Name>ThemeSources`). Не зависит от
    /// `-o`: место бандла задаётся `--standalone-output` (по умолчанию `build/standalone`).
    private func standaloneBundleURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
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
    private func themePackageDir(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        sourcesRootURL.appending(path: "Themes/\(config.name)Theme")
    }

    /// `EnvironmentValueProvider+DefaultValues.swift` из пакета темы.
    private func defaultValuesURL(config: DesignSystemBuilderConfiguration.ThemeConfiguration) -> URL {
        themePackageDir(config: config).appending(component: "EnvironmentValueProvider+DefaultValues.swift")
    }

    /// Собирает автономную плоскую папку исходников темы рядом с `themeURL`.
    /// Без компонентов — только токены; с `includeComponents` — плюс компонентный слой.
    private func emitStandaloneBundle(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
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
        Logger.printText("⏰ Running DesignSystemBuilder...")
        Logger.printLine()

        ComponentConfigSource.localDirectory = designSystemBuilderURL
        if !standalone { loadApiMeta() }
        fetchSourcesIfNeeded()

        for themeConfig in config.themes {
            Logger.printText("🚀 Generating code for theme \(themeConfig.name)...")
            executeCommands(config: config, themeConfig: themeConfig)
        }

        Logger.printLine()
        return .empty
    }
}
