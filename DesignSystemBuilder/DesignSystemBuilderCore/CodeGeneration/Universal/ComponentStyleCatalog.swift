import Foundation

enum ComponentStyleCatalog {

    private struct Entry {
        let variationIds: Set<String>
    }

    private static var themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration?
    private static var entries: [CodeGenerationComponent: Entry?] = [:]
    private static var reported: Set<String> = []

    static func reset(themeConfig: DesignSystemBuilderConfiguration.ThemeConfiguration) {
        guard Self.themeConfig?.name != themeConfig.name else { return }
        Self.themeConfig = themeConfig
        entries = [:]
        reported = []
    }

    static func contains(component: CodeGenerationComponent, path: [String]) -> Bool {
        guard themeConfig != nil else { return true }
        guard let entry = entry(for: component) else { return false }
        guard !path.isEmpty else { return true }
        for prefixLength in stride(from: path.count, through: 1, by: -1) {
            let id = path.prefix(prefixLength).joined(separator: ".")
            guard entry.variationIds.contains(id) else { continue }
            return path.count - prefixLength <= 1
        }
        return false
    }

    static func reportSkipped(style: String) {
        guard reported.insert(style).inserted else { return }
        Logger.printText("Style \"\(style)\" not found in theme \(themeConfig?.name ?? "?") — reference skipped")
    }

    private static func entry(for component: CodeGenerationComponent) -> Entry? {
        if let cached = entries[component] { return cached }
        let entry = load(component)
        entries[component] = entry
        return entry
    }

    private static func load(_ component: CodeGenerationComponent) -> Entry? {
        guard let themeConfig,
              let data = ComponentConfigSource.data(for: component, themeConfig: themeConfig),
              let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return nil
        }
        let variations = json["variations"] as? [[String: Any]] ?? []
        return Entry(variationIds: Set(variations.compactMap { $0["id"] as? String }))
    }
}
