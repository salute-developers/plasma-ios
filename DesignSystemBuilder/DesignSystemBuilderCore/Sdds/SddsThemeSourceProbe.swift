import Foundation

/// Проверка, что `.sdds` пригодна как источник темы.
///
/// Нужна CLI: генерация из `.sdds` должна отказать сразу и понятно, если директория пуста
/// или в ней нет токенов, а не молча свалиться в fallback на zip-схему.
public enum SddsThemeSourceProbe {
    /// Возвращает `true`, если по `configURL` читается полный источник темы:
    /// `config.json` с тенантами, файлы схемы базового тенанта и палитра.
    ///
    /// - Parameter configURL: путь к `.sdds/config.json`.
    public static func isReadable(configURL: URL) -> Bool {
        // Пути внутри config.json заданы относительно родителя `.sdds`.
        let baseDirectory = configURL.deletingLastPathComponent().deletingLastPathComponent()
        return SddsThemeSourceReader(configURL: configURL, baseDirectory: baseDirectory).read() != nil
    }

    /// Имя базового тенанта из `.sdds/config.json` либо `nil`, если источник нечитаем.
    ///
    /// CLI выводит из него имя схемы theme-converter, откуда берутся конфиги компонентов.
    public static func baseTenantName(configURL: URL) -> String? {
        let baseDirectory = configURL.deletingLastPathComponent().deletingLastPathComponent()
        return SddsThemeSourceReader(configURL: configURL, baseDirectory: baseDirectory).read()?.baseName
    }
}
