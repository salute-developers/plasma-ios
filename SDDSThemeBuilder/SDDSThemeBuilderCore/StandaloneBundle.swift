import Foundation

/// Собирает self-contained **плоскую папку `.swift`** для слоя токенов темы:
/// сгенерированные токены + `FontsManifest` + вендоренные исходники `SDDSThemeCore`
/// + сгенерированный `Theme.swift`. Всё компилируется как ОДИН модуль без линковки
/// внешних библиотек — клиент кидает файлы в свой target и может обфусцировать.
///
/// Tier A (токены). Механизм vendoring + стрипа импортов расширяется на компоненты
/// (`SDDSComponents` + `SDDSIcons`) отдельным слоем.
struct StandaloneBundle {
    /// Модули, `import` которых вырезается (их исходники вендорятся в тот же модуль).
    static let strippedModules = ["SDDSThemeCore"]

    let bundleDir: URL
    /// Директория со сгенерированными токенами (`<themeURL>/Tokens`).
    let tokensDir: URL
    /// `<themeURL>/Fonts/FontsManifest.swift`.
    let fontsManifestURL: URL
    /// Дерево исходников `SDDSThemeCore/Sources/SDDSThemeCore`.
    let coreSourcesURL: URL
    let themeName: String     // "<Name>Theme"
    let registryKey: String   // ThemeConfiguration.name (ключ в ThemeTenantRegistry)

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

        // 1. Сгенерированные токены (base + тенанты).
        for url in swiftFiles(inTree: tokensDir) {
            writeStripped(url, isFontsManifest: false, used: &used); count += 1
        }
        // 2. FontsManifest — вырезаем его `struct FontInfo` (его даёт вендоренный core).
        if fm.fileExists(atPath: fontsManifestURL.path) {
            writeStripped(fontsManifestURL, isFontsManifest: true, used: &used); count += 1
        }
        // 3. Вендоренный SDDSThemeCore (46 файлов, ноль внешних зависимостей).
        for url in swiftFiles(inTree: coreSourcesURL) {
            writeStripped(url, isFontsManifest: false, used: &used); count += 1
        }
        // 4. Сгенерированный Theme.swift (энтрипоинт рантайма).
        let dest = uniqueDest(for: "Theme.swift", used: &used)
        try? themeSource().data(using: .utf8)?.write(to: dest); count += 1

        return count
    }

    // MARK: - Copy + strip

    private func writeStripped(_ url: URL, isFontsManifest: Bool, used: inout Set<String>) {
        guard var text = try? String(contentsOf: url, encoding: .utf8) else { return }
        text = Self.stripImports(text)
        if isFontsManifest {
            text = Self.stripFontInfoStruct(text)
        }
        let dest = uniqueDest(for: url.lastPathComponent, used: &used)
        try? text.data(using: .utf8)?.write(to: dest, options: .atomic)
    }

    private func uniqueDest(for name: String, used: inout Set<String>) -> URL {
        var candidate = name
        var i = 1
        while used.contains(candidate) {
            let ext = (name as NSString).pathExtension
            let base = (name as NSString).deletingPathExtension
            candidate = "\(base)_\(i).\(ext)"
            i += 1
        }
        used.insert(candidate)
        return bundleDir.appending(component: candidate)
    }

    private func swiftFiles(inTree dir: URL) -> [URL] {
        guard let en = FileManager.default.enumerator(at: dir, includingPropertiesForKeys: nil) else { return [] }
        return en.compactMap { $0 as? URL }.filter { $0.pathExtension == "swift" }.sorted { $0.path < $1.path }
    }

    /// Убирает строки `import <M>` и `@_exported import <M>` для вендоренных модулей.
    static func stripImports(_ text: String) -> String {
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

    // MARK: - Theme.swift generation (Tier A)

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

        return """
        // This file is code generated. Do not modify.
        import Foundation
        import SwiftUI

        public class Theme {
            static let name = "\(themeName)"

            public class func initialize(onComplete: @escaping () -> Void = {}) {
                initialize(tenant: .none, onComplete: onComplete)
            }

            public class func initialize(tenant: Tenant, onComplete: @escaping () -> Void = {}) {
                registerTenants()
                ThemeTenantRegistry.shared.setActive(tenant, for: "\(registryKey)")
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
        }
        """
    }

    private func lowerFirst(_ s: String) -> String {
        guard let f = s.first else { return s }
        return f.lowercased() + s.dropFirst()
    }
}
