import Foundation

enum ComponentIndex {

    struct Entry: Decodable {
        let componentName: String
        let styleName: String
        let config: String
    }

    private struct Index: Decodable {
        let components: [Entry]
    }

    private static var cache: [String: [String: Entry]] = [:]

    static func entries(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> [String: Entry] {
        if let cached = cache[themeConfig.name] { return cached }
        let entries = load(themeConfig: themeConfig)
        cache[themeConfig.name] = entries
        return entries
    }

    static func entry(
        for component: CodeGenerationComponent,
        themeConfig: ThemeBuilderConfiguration.ThemeConfiguration
    ) -> Entry? {
        entries(themeConfig: themeConfig)[component.dsStyleKey]
    }

    static func notImplemented(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> [String] {
        let ours = Set(CodeGenerationComponent.allCases.map { $0.dsStyleKey })
        return entries(themeConfig: themeConfig).values
            .filter { !ours.contains(normalize($0.styleName)) }
            .map { $0.styleName }
            .sorted()
    }

    /// Дефисы/подчёркивания у DS и у нас расставлены по-разному
    /// (`check-box` / `Checkbox`) — это форматирование, не смысл, поэтому
    /// сопоставляем без них.
    fileprivate static func normalize(_ value: String) -> String {
        value.lowercased().filter { $0.isLetter || $0.isNumber }
    }

    private static func load(themeConfig: ThemeBuilderConfiguration.ThemeConfiguration) -> [String: Entry] {
        guard let data = ComponentConfigSource.data(filename: "meta.json", themeConfig: themeConfig),
              let index = try? JSONDecoder().decode(Index.self, from: data) else {
            return [:]
        }
        return Dictionary(index.components.map { (normalize($0.styleName), $0) }, uniquingKeysWith: { first, _ in first })
    }
}

extension CodeGenerationComponent {
    /// DS называет компонент словом, не выводимым из имени файла конфига
    /// (bottom sheet у DS — разновидность модалки, а не отдельное слово).
    private static let dsStyleNameOverrides: [CodeGenerationComponent: String] = [
        .bottomSheet: "modal-bottom-sheet"
    ]

    /// Ключ поиска в индексе DS — по умолчанию имя файла конфига без
    /// суффикса `_config.json` (та же таблица `configurationFilenames`,
    /// которая уже нужна для поиска самого файла), нормализованное.
    fileprivate var dsStyleKey: String {
        let name = Self.dsStyleNameOverrides[self]
            ?? configurationFilename.replacingOccurrences(of: "_config.json", with: "")
        return ComponentIndex.normalize(name)
    }
}
