import Foundation

/// Собирает self-contained **плоскую папку `.swift`** темы, компилируемую как ОДИН
/// модуль без линковки внешних библиотек — клиент кидает файлы в свой target и может
/// обфусцировать.
///
/// Два уровня:
/// - **уровень токенов** — сгенерированные токены + `FontsManifest` + вендоренный
///   `SDDSThemeCore` + `Theme.swift`.
/// - **уровень компонентов** (`includeComponents`) — дополнительно: вариации компонентов
///   темы, вендоренные `SDDSComponents` + `InputMask` + `SDDSIcons` (source `Asset` +
///   `.xcassets`), регистрация дефолтных appearance и полный `Theme.swift`.
///
/// Механизм один: вендоринг по границе модуля + построчный стрип внутренних `import`
/// + снятие модульных квалификаторов (`SDDSThemeCore.` и т.п.) + разведение совпадающих
/// имён типов (`FontInfo`, `StatefulColor`). После сборки — guard по импортам и дублям.
struct StandaloneBundle {
    let bundleDir: URL
    /// Директория со сгенерированными токенами (`<themeURL>/Tokens`).
    let tokensDir: URL
    /// `<themeURL>/Fonts/FontsManifest.swift`.
    let fontsManifestURL: URL
    /// Дерево исходников `SDDSThemeCore/Sources/SDDSThemeCore`.
    let coreSourcesURL: URL
    let themeName: String     // "<Name>Theme"
    let registryKey: String   // ThemeConfiguration.name (ключ в ThemeTenantRegistry)

    // MARK: Компонентный слой (пусто/nil, когда генерятся только токены)

    /// Собирать компонентный слой.
    var includeComponents: Bool = false
    /// Вендорить исходники внешних зависимостей (InputMask) в бандл. По умолчанию `false`:
    /// InputMask остаётся внешним — его исходники не копируются, `import InputMask`
    /// сохранён, клиент линкует модуль сам. С `true` его исходники встраиваются
    /// (бандл полностью автономен).
    var vendorExternalDependencies: Bool = false
    /// `SDDSComponents/Sources/SDDSComponents`.
    var componentsSourcesURL: URL?
    /// Библиотечные исходники `InputMask` (`.../InputMask/Classes`).
    var inputMaskSourcesURL: URL?
    /// Сгенерированный swiftgen `SDDSIcons/Generated/Assets.swift`.
    var iconsAssetsSwiftURL: URL?
    /// Каталоги ресурсов (`Assets.xcassets`) — копируются целиком, без правок.
    var xcassetsDirs: [URL] = []
    /// Рабочая папка темы (`<themeURL>`) — из неё берутся `<Component>/*.swift`.
    var componentThemeDir: URL?
    /// Коммитнутый `EnvironmentValueProvider+DefaultValues.swift` темы (репо-тема).
    var defaultValuesURL: URL?

    /// Модули, `import`/квалификатор которых снимается (их исходники вендорятся сюда же).
    /// InputMask попадает сюда только когда вендорим внешние зависимости; иначе остаётся
    /// внешним и его импорт сохраняется.
    var strippedModules: [String] {
        guard includeComponents else { return ["SDDSThemeCore"] }
        var modules = ["SDDSThemeCore", "SDDSComponents", "SDDSIcons", "SDDSApiInfo"]
        if vendorExternalDependencies { modules.append("InputMask") }
        return modules
    }

    /// Не-системные модули, которым разрешено остаться `import`'ом (внешние зависимости,
    /// не вендоримые в бандл). Guard их не считает утечкой.
    private var allowedExternalModules: Set<String> {
        vendorExternalDependencies ? [] : ["InputMask"]
    }

    /// Переименования символов InputMask при слиянии в общий модуль — только в
    /// InputMask-файлах (движок масок самодостаточен, эти типы снаружи не видны):
    /// - `State` конфликтует со SwiftUI `@State` (после слияния `internal class State`
    ///   затеняет property wrapper — `@State` перестаёт компилироваться);
    /// - `ValueState` конфликтует с `public protocol ValueState` ядра.
    /// `\b…\b` не заденет `StateType`/`ValueState` при ренейме `State`.
    private static let inputMaskRenames: [String: String] = [
        "State": "InputMaskState",
        "ValueState": "InputMaskValueState"
    ]

    /// Curated-набор имён публичных SwiftUI/UIKit-типов, которые темы переиспользуют для
    /// своих namespace вариаций (`struct Image`, `struct Divider` …). Их нельзя обнаружить
    /// сканированием (типы в SDK, не в репозитории), поэтому список задаётся явно и
    /// пересекается с фактически объявленными в теме типами (см. `computeThemeRenames`).
    private static let swiftUITypeNames: Set<String> = [
        "Image", "Divider", "Text", "Color", "LinearGradient", "RadialGradient", "AngularGradient",
        "Gradient", "Section", "Menu", "Label", "Link", "Toggle", "Slider", "Stepper", "Spacer",
        "List", "Form", "Group", "Path", "Circle", "Rectangle", "Ellipse", "Capsule", "Button",
        "Picker", "ProgressView", "Shape", "Font", "Angle", "Shadow", "Alignment", "Edge",
        "UnitPoint", "State", "Binding", "Environment", "Namespace", "ScrollView", "TabView",
        "NavigationView", "NavigationStack", "Table", "Grid", "GridRow", "AnyView", "EmptyView"
    ]

    /// `SDDSThemeCore` объявляет собственные gradient-токены с именами SwiftUI-типов
    /// (`struct LinearGradient` и т.д.), разводя их квалификатором `SwiftUI.…`. При
    /// слиянии в один модуль эти токены затеняют SwiftUI-типы и ломают компоненты
    /// (напр. `AngularGradient(colors:center:…)` в `SDDSSpinner`). Переименовываем
    /// core-токены (в core-файлах и в token-файлах темы, где они конструируются);
    /// `SwiftUI.`-квалифицированные вхождения не трогаем (lookbehind `(?<!\.)`).
    private static let coreGradientRenames: [String: String] = [
        "LinearGradient": "SDDSLinearGradient",
        "RadialGradient": "SDDSRadialGradient",
        "AngularGradient": "SDDSAngularGradient"
    ]

    /// Core-файлы, чьё содержимое дословно дублируется в SDDSComponents — при включённых
    /// компонентах не встраиваются (канонична компонентная версия; ссылки ядра резолвятся на неё
    /// в общем модуле). `View+Conditional.swift` — единственный `applyIf`, идентичный
    /// `SDDSComponents/…/View+Modifiers.swift`.
    private static let coreFilesShadowedByComponents: Set<String> = ["View+Conditional.swift"]

    /// Системные фреймворки, которым разрешено остаться `import`'ом в бандле.
    private static let systemModules: Set<String> = [
        "Foundation", "SwiftUI", "UIKit", "AppKit", "Combine",
        "CoreGraphics", "CoreText", "CoreImage", "CoreFoundation",
        "QuartzCore", "Darwin", "os", "ObjectiveC", "Dispatch", "Accelerate"
    ]

    /// Имена тенантов выводятся из сгенерированных файлов `Colors+<Tenant>+Generated.swift`
    /// (точнее, чем список из конфига: для `.sdds` тенанты отличаются). Их
    /// `register<Tenant>()` вызываются в `Theme.registerTenants()`.
    private func detectedTenants() -> [String] {
        swiftFiles(inTree: tokensDir).compactMap { url -> String? in
            let parts = url.lastPathComponent.components(separatedBy: "+")
            guard parts.count == 3, parts[0] == "Colors", parts[2] == "Generated.swift" else { return nil }
            return parts[1]
        }
    }

    @discardableResult
    func emit() -> Int {
        let fm = FileManager.default
        try? fm.removeItem(at: bundleDir)
        try? fm.createDirectory(at: bundleDir, withIntermediateDirectories: true)

        var used = Set<String>()
        var count = 0

        // Токены темы и core конструируют core-gradient-токены (`LinearGradient` и т.д.) —
        // разводим их с одноимёнными SwiftUI-типами (актуально только при включённых
        // компонентах; без них безвредно — компонентов нет).
        let coreRenames = includeComponents ? Self.coreGradientRenames : [:]

        // 1. Сгенерированные токены (base + тенанты).
        for url in swiftFiles(inTree: tokensDir) {
            writeStripped(url, isFontsManifest: false, renames: coreRenames, used: &used); count += 1
        }
        // 2. FontsManifest — вырезаем его `struct FontInfo` (его даёт вендоренный core).
        if fm.fileExists(atPath: fontsManifestURL.path) {
            writeStripped(fontsManifestURL, isFontsManifest: true, renames: coreRenames, used: &used); count += 1
        }
        // 3. Вендоренный SDDSThemeCore (ноль внешних зависимостей). При включённых
        //    компонентах пропускаем core-файлы, чей символ дословно дублирует SDDSComponents
        //    (напр. `applyIf` — идентичный extension-метод в обоих модулях).
        for url in swiftFiles(inTree: coreSourcesURL)
        where !(includeComponents && Self.coreFilesShadowedByComponents.contains(url.lastPathComponent)) {
            writeStripped(url, isFontsManifest: false, renames: coreRenames, used: &used); count += 1
        }

        if includeComponents {
            count += emitComponentLayer(used: &used)
        }

        // Последним — сгенерированный Theme.swift (энтрипоинт рантайма).
        let dest = uniqueDest(for: "Theme.swift", used: &used)
        try? Self.withHeader(themeSource()).data(using: .utf8)?.write(to: dest); count += 1

        runGuards()
        return count
    }

    // MARK: - Компонентный слой

    private func emitComponentLayer(used: inout Set<String>) -> Int {
        let fm = FileManager.default
        var count = 0

        // Автоопределяем namespace вариаций темы, совпадающие именами с типами
        // SDDSComponents/SwiftUI (+ core-gradient-токены) — набор зависит от темы,
        // поэтому вычисляется, а не хардкодится.
        let themeRenames = computeThemeRenames()

        // 4. Вариации компонентов темы (`<themeURL>/<Component>/*.swift`), кроме токенов,
        //    шрифтов и файлов, которые генерим/копируем отдельно. Разводим namespace
        //    вариаций, совпадающие именами с типами SDDSComponents/SwiftUI.
        if let themeDir = componentThemeDir {
            for url in componentVariationFiles(inTree: themeDir) {
                writeStripped(url, isFontsManifest: false, renames: themeRenames, used: &used); count += 1
            }
        }
        // 5. Вендоренный SDDSComponents. `StatefulColor.swift` пропускаем — дубль ядра.
        if let componentsURL = componentsSourcesURL {
            for url in swiftFiles(inTree: componentsURL) where url.lastPathComponent != "StatefulColor.swift" {
                writeStripped(url, isFontsManifest: false, used: &used); count += 1
            }
        }
        // 6. InputMask. По умолчанию — внешняя зависимость: не копируем, `import InputMask`
        //    в компонентах сохранён, клиент линкует модуль сам. При `vendorExternalDependencies`
        //    встраиваем его исходники (чистый Swift), переименовывая `State`/`ValueState`,
        //    конфликтующие со SwiftUI `@State` / протоколом ядра при слиянии в один модуль.
        if vendorExternalDependencies, let inputMaskURL = inputMaskSourcesURL {
            for url in swiftFiles(inTree: inputMaskURL) {
                writeStripped(url, isFontsManifest: false, renames: Self.inputMaskRenames, used: &used); count += 1
            }
        }
        // 7. Иконки: source `Asset` (SwiftGen). `.xcassets` копируется отдельно (п.9).
        if let iconsURL = iconsAssetsSwiftURL, fm.fileExists(atPath: iconsURL.path) {
            writeStripped(iconsURL, isFontsManifest: false, used: &used); count += 1
        }
        // 8. Регистрация дефолтных appearance компонентов (репо-тема — коммитнутый файл).
        //    Ссылается на namespace вариаций → те же ре-нейминги, что и в п.4.
        if let defaultValuesURL = defaultValuesURL, fm.fileExists(atPath: defaultValuesURL.path) {
            writeStripped(defaultValuesURL, isFontsManifest: false, renames: themeRenames, used: &used); count += 1
        }
        // 9. Каталоги ресурсов — копируем целиком, без правок.
        for xcassets in xcassetsDirs where fm.fileExists(atPath: xcassets.path) {
            let destName = uniqueName(for: xcassets.lastPathComponent, used: &used)
            try? fm.copyItem(at: xcassets, to: bundleDir.appending(component: destName))
            count += 1
        }

        return count
    }

    /// `.swift` из рабочей папки темы, кроме токенов/шрифтов и файлов, которые бандл
    /// генерирует/копирует сам либо которые тянут внешние модули (`Package.swift` →
    /// `PackageDescription`, `*SandboxThemeProvider.swift` → песочница).
    private func componentVariationFiles(inTree dir: URL) -> [URL] {
        let excludedNames: Set<String> = ["Theme.swift", "EnvironmentValueProvider+DefaultValues.swift", "Package.swift"]
        return swiftFiles(inTree: dir).filter { url in
            let path = url.path
            if path.contains("/Tokens/") || path.contains("/Fonts/") { return false }
            let name = url.lastPathComponent
            if excludedNames.contains(name) { return false }
            if name.hasSuffix("SandboxThemeProvider.swift") { return false }
            return true
        }
    }

    // MARK: - Collision auto-detection

    /// Top-level (column 0) публичные/internal имена типов, объявленные в дереве.
    private func scanTopLevelTypeNames(inTree dir: URL) -> Set<String> {
        var names = Set<String>()
        for url in swiftFiles(inTree: dir) {
            guard let text = try? String(contentsOf: url, encoding: .utf8) else { continue }
            for line in text.split(separator: "\n", omittingEmptySubsequences: false) {
                if let name = Self.topLevelTypeName(line: String(line)) { names.insert(name) }
            }
        }
        return names
    }

    /// Вычисляет ре-нейминги для файлов пакета темы: имена типов, которые тема объявляет
    /// как namespace вариаций и которые совпадают с типом `SDDSComponents` или SwiftUI
    /// (при слиянии в один модуль — конфликт). Набор зависит от компонентов темы
    /// (напр. у PlasmaHomeDS есть `WheelSize`, у SDDSServ нет), поэтому определяется
    /// сканированием, а не списком. Плюс core-gradient-токены (общие для всех тем).
    private func computeThemeRenames() -> [String: String] {
        guard let componentsURL = componentsSourcesURL, let themeDir = componentThemeDir else {
            return Self.coreGradientRenames
        }
        let componentTypes = scanTopLevelTypeNames(inTree: componentsURL)
        var map: [String: String] = [:]
        for url in componentVariationFiles(inTree: themeDir) {
            guard let text = try? String(contentsOf: url, encoding: .utf8) else { continue }
            for line in text.split(separator: "\n", omittingEmptySubsequences: false) {
                guard let name = Self.topLevelTypeName(line: String(line)) else { continue }
                if componentTypes.contains(name) || Self.swiftUITypeNames.contains(name) {
                    map[name] = "\(name)ThemeNS"
                }
            }
        }
        return map.merging(Self.coreGradientRenames) { current, _ in current }
    }

    // MARK: - Copy + strip

    private func writeStripped(_ url: URL, isFontsManifest: Bool, renames: [String: String] = [:], used: inout Set<String>) {
        guard var text = try? String(contentsOf: url, encoding: .utf8) else { return }
        text = stripImports(text)
        text = stripApiMarkers(text)
        text = stripModuleQualifiers(text)
        text = renameSymbols(text, renames)
        if isFontsManifest {
            text = Self.stripFontInfoStruct(text)
        }
        let dest = uniqueDest(for: url.lastPathComponent, used: &used)
        try? Self.withHeader(text).data(using: .utf8)?.write(to: dest, options: .atomic)
    }

    /// Шапка «не редактировать» в начало каждого `.swift` бандла — и сгенерированного, и
    /// вендоренного. При обновлении версии бандл перегенерируется, и ручные правки перетрутся.
    private static let doNotEditHeader = """
    // Code generated by DesignSystemBuilder — part of a standalone SDDS theme bundle.
    // DO NOT EDIT: this file is overwritten when the bundle is regenerated or updated.


    """

    private static func withHeader(_ text: String) -> String {
        doNotEditHeader + text
    }

    /// Пословный ре-нейминг символов для разведения совпадающих имён типов между
    /// вендоренными модулями (`ValueState` InputMask, `LinearGradient` ядра, namespace
    /// вариаций темы). Lookbehind `(?<!\.)` не трогает квалифицированные вхождения
    /// (`SwiftUI.AngularGradient`, `foo.State`) — переименовываем только «свой» тип.
    private func renameSymbols(_ text: String, _ map: [String: String]) -> String {
        guard !map.isEmpty else { return text }
        var result = text
        for (from, to) in map {
            let pattern = "(?<!\\.)\\b\(NSRegularExpression.escapedPattern(for: from))\\b"
            guard let re = try? NSRegularExpression(pattern: pattern) else { continue }
            let range = NSRange(result.startIndex..., in: result)
            result = re.stringByReplacingMatches(in: result, range: range, withTemplate: to)
        }
        return result
    }

    private func uniqueDest(for name: String, used: inout Set<String>) -> URL {
        bundleDir.appending(component: uniqueName(for: name, used: &used))
    }

    private func uniqueName(for name: String, used: inout Set<String>) -> String {
        var candidate = name
        var i = 1
        while used.contains(candidate) {
            let ext = (name as NSString).pathExtension
            let base = (name as NSString).deletingPathExtension
            candidate = ext.isEmpty ? "\(base)_\(i)" : "\(base)_\(i).\(ext)"
            i += 1
        }
        used.insert(candidate)
        return candidate
    }

    private func swiftFiles(inTree dir: URL) -> [URL] {
        guard let en = FileManager.default.enumerator(at: dir, includingPropertiesForKeys: nil) else { return [] }
        return en.compactMap { $0 as? URL }.filter { $0.pathExtension == "swift" }.sorted { $0.path < $1.path }
    }

    /// Убирает строки `import <M>` и `@_exported import <M>` для вендоренных модулей.
    private func stripImports(_ text: String) -> String {
        let modules = Set(strippedModules)
        return text
            .split(separator: "\n", omittingEmptySubsequences: false)
            .filter { line in
                let t = line.trimmingCharacters(in: .whitespaces)
                for m in modules where t == "import \(m)" || t == "@_exported import \(m)" {
                    return false
                }
                return true
            }
            .joined(separator: "\n")
    }

    private func stripApiMarkers(_ text: String) -> String {
        text
            .split(separator: "\n", omittingEmptySubsequences: false)
            .filter { !Self.isApiMarker(String($0)) }
            .joined(separator: "\n")
    }

    static func isApiMarker(_ line: String) -> Bool {
        let trimmed = line.trimmingCharacters(in: .whitespaces)
        guard trimmed.hasPrefix("@Api") else { return false }
        let name = trimmed.dropFirst().prefix { $0.isLetter }
        return trimmed == "@\(name)" || trimmed.hasPrefix("@\(name)(") && trimmed.hasSuffix(")")
    }

    /// Снимает модульные квалификаторы вендоренных модулей (`SDDSThemeCore.FontInfo` →
    /// `FontInfo`): в едином модуле имя модуля больше не резолвится. Точка после имени
    /// защищает от совпадений с идентификаторами-префиксами (`SDDSComponentsFoo`).
    private func stripModuleQualifiers(_ text: String) -> String {
        var result = text
        for module in strippedModules {
            result = result.replacingOccurrences(of: "\(module).", with: "")
        }
        return result
    }

    /// Вырезает блок `... struct FontInfo { ... }` (его определяет core/FontsService).
    static func stripFontInfoStruct(_ text: String) -> String {
        var lines = text.split(separator: "\n", omittingEmptySubsequences: false).map(String.init)
        guard let start = lines.firstIndex(where: { $0.contains("struct FontInfo") && $0.contains("{") }) else {
            return text
        }
        var depth = 0
        var end = start
        for i in start..<lines.count {
            depth += lines[i].filter { $0 == "{" }.count
            depth -= lines[i].filter { $0 == "}" }.count
            if depth == 0 { end = i; break }
        }
        lines.removeSubrange(start...end)
        return lines.joined(separator: "\n")
    }

    // MARK: - Guards (страховка полноты)

    /// После эмита: (1) падаем, если во всех `.swift` бандла всплыл не-системный
    /// `import` кроме вендоренных (значит модуль не встроен); (2) падаем на неожиданном
    /// дубле top-level типа (значит при апдейте либ появился новый — ловим у себя).
    private func runGuards() {
        let files = swiftFiles(inTree: bundleDir)
        var typeOwners: [String: String] = [:]

        for url in files {
            guard let text = try? String(contentsOf: url, encoding: .utf8) else { continue }
            for line in text.split(separator: "\n", omittingEmptySubsequences: false) {
                let trimmed = line.trimmingCharacters(in: .whitespaces)

                if trimmed.hasPrefix("import "), let module = trimmed.split(separator: " ").last.map(String.init) {
                    if !Self.systemModules.contains(module) && !strippedModules.contains(module) && !allowedExternalModules.contains(module) {
                        Logger.terminate("Standalone bundle leaks non-vendored import '\(module)' in \(url.lastPathComponent)")
                    }
                }

                if Self.isApiMarker(trimmed) {
                    Logger.terminate("Standalone bundle leaks API marker '\(trimmed)' in \(url.lastPathComponent)")
                }

                if let name = Self.topLevelTypeName(line: String(line)) {
                    if let owner = typeOwners[name] {
                        Logger.terminate("Standalone bundle duplicate top-level type '\(name)' in \(url.lastPathComponent) (also in \(owner))")
                    }
                    typeOwners[name] = url.lastPathComponent
                }
            }
        }
    }

    /// Имя top-level (column 0) объявления типа, иначе nil. Extensions игнорируются
    /// (несколько extension одного типа — норма). `private`/`fileprivate` тоже
    /// пропускаются: они файл-scoped, поэтому одноимённые типы в разных файлах —
    /// легально (напр. `private struct ScrollOffsetPreferenceKey` в двух компонентах).
    private static func topLevelTypeName(line: String) -> String? {
        guard let first = line.first, first != " ", first != "\t" else { return nil }
        let tokens = line.split(whereSeparator: { $0 == " " || $0 == ":" || $0 == "{" }).map(String.init)
        let keywords: Set<String> = ["struct", "class", "enum", "protocol", "actor", "typealias"]
        guard let kwIndex = tokens.firstIndex(where: { keywords.contains($0) }),
              kwIndex + 1 < tokens.count else { return nil }
        let leading = Set(tokens[..<kwIndex])
        // Файл-приватные типы не конфликтуют между файлами — не считаем дублем.
        if leading.contains("private") || leading.contains("fileprivate") { return nil }
        // Всё до ключевого слова — только модификаторы (public/final/…); иначе это не объявление.
        let modifiers: Set<String> = ["public", "internal", "private", "fileprivate", "open", "final", "static", "indirect"]
        guard leading.allSatisfy({ modifiers.contains($0) }) else { return nil }
        let name = tokens[kwIndex + 1].split(separator: "<").first.map(String.init) ?? tokens[kwIndex + 1]
        return name.isEmpty ? nil : name
    }

    // MARK: - Theme.swift generation

    private func themeSource() -> String {
        let tenants = detectedTenants()
        let indent = "        "
        let registrations = tenants.map { name in
            ["Colors", "Gradients", "Shapes", "Shadows", "Spacings", "Typographies"]
                .map { "\(indent)\($0).register\(name)()" }
                .joined(separator: "\n")
        }.joined(separator: "\n")

        let tenantExtensions = tenants.map { name in
            "public extension Tenant {\n    static let \(lowerFirst(name)) = Tenant(name: \"\(name)\")\n}"
        }.joined(separator: "\n")

        let availableTenants = tenants.map { ".\(lowerFirst($0))" }.joined(separator: ", ")

        // С компонентами: `View.subtheme(_:)` (ключ `\.subtheme` живёт в SDDSComponents) и,
        // если в бандл включён файл регистрации appearance, вызов `setDefaultValues()`.
        let hasDefaultValues = defaultValuesURL != nil
        let defaultValuesCall = (includeComponents && hasDefaultValues) ? "\n            EnvironmentValueProvider.shared.setDefaultValues()" : ""
        let subthemeViewExtension = includeComponents ? """


        public extension View {
            func subtheme(_ subtheme: Subtheme) -> some View {
                environment(\\.subtheme, Theme.subtheme(subtheme))
            }
        }
        """ : ""

        return """
        import Foundation
        import SwiftUI

        public class Theme {
            static let name = "\(themeName)"

            public class func initialize(onComplete: @escaping () -> Void = {}) {
                initialize(tenant: .none, onComplete: onComplete)
            }

            public class func initialize(tenant: Tenant, onComplete: @escaping () -> Void = {}) {
                registerTenants()
                ThemeTenantRegistry.shared.setActive(tenant, for: "\(registryKey)")\(defaultValuesCall)
                FontsService.shared.initialize(fonts: FontsManifest.fonts) { _ in
                    onComplete()
                }
            }

            public class func subtheme(_ subtheme: Subtheme) -> SubthemeData {
                .init(
                    subtheme: subtheme,
                    colorMapper: { subtheme, colorToken in colorToken.token(for: subtheme) },
                    gradientMapper: { subtheme, gradientToken in gradientToken.token(for: subtheme) }
                )
            }

            private static var tenantsRegistered = false
            private class func registerTenants() {
                guard !tenantsRegistered else { return }
                tenantsRegistered = true
        \(registrations)
            }
        }

        \(tenantExtensions)

        public extension Theme {
            static var availableTenants: [Tenant] { [\(availableTenants)] }
        }\(subthemeViewExtension)
        """
    }

    private func lowerFirst(_ s: String) -> String {
        guard let f = s.first else { return s }
        return f.lowercased() + s.dropFirst()
    }
}
