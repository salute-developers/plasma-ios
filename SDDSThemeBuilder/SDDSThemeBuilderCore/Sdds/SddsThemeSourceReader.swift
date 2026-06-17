import Foundation

/// Резолвленный локальный источник темы из `.sdds/`.
/// Первый tenant — внутренняя база (`Tenant.Default`, пустой suffix),
/// остальные — обычные iOS-tenants с suffix `alias ?: name`.
struct SddsThemeSource {
    struct Tenant {
        /// Публичное имя tenant'а (`alias ?: name`).
        let displayName: String
        /// Суффикс генерируемых токенов: `""` для первого tenant, иначе `displayName`.
        let suffix: String
        /// Директория с распакованными файлами схемы (`meta.json` + `ios/ios_*.json`).
        let directory: URL
    }

    let baseName: String
    let tenants: [Tenant]
    let paletteURL: URL
}

/// Читает локальный DSBuilder-источник из `.sdds/config.json`.
///
/// `baseDirectory` — родитель папки `.sdds` (для iOS это `SDDSThemeBuilder/`);
/// относительно неё резолвятся `directoryPath`/`palettePath`, как `projectDir` на Android.
///
/// `read()` возвращает `nil`, если `.sdds` отсутствует или неполон — в этом случае
/// вызывающий код откатывается на zip/url-источник темы.
final class SddsThemeSourceReader {
    private let configURL: URL
    private let baseDirectory: URL
    private let fileManager: FileManager

    init(configURL: URL, baseDirectory: URL, fileManager: FileManager = .default) {
        self.configURL = configURL
        self.baseDirectory = baseDirectory
        self.fileManager = fileManager
    }

    func read() -> SddsThemeSource? {
        guard fileManager.fileExists(atPath: configURL.path()) else {
            Logger.printText("ℹ️ \(Constants.configFileName) not found at \(configURL.path()) — falling back to remote/zip source")
            return nil
        }

        guard let data = try? Data(contentsOf: configURL),
              let config = try? JSONDecoder().decode(SddsConfig.self, from: data) else {
            Logger.printText("⚠️ Unable to decode \(configURL.path()) — falling back to remote/zip source")
            return nil
        }

        guard !config.tenants.isEmpty else {
            Logger.printText("⚠️ \(Constants.configFileName) must contain at least one tenant — falling back to remote/zip source")
            return nil
        }

        let tenants: [SddsThemeSource.Tenant] = config.tenants.enumerated().map { index, tenant in
            let path = tenant.directoryPath ?? "\(Constants.sddsDir)/\(tenant.name)"
            return SddsThemeSource.Tenant(
                displayName: tenant.publicName,
                suffix: index == 0 ? "" : tenant.publicName,
                directory: resolve(path: path)
            )
        }

        guard let baseTenant = tenants.first,
              SchemeDirectory.make(fromUnpackedDirectory: baseTenant.directory) != nil else {
            Logger.printText("⚠️ Missing required scheme files in \(tenants.first?.directory.path() ?? "?") — falling back to remote/zip source")
            return nil
        }

        let palettePath = config.palettePath ?? Constants.defaultPalettePath
        let paletteURL = resolve(path: palettePath)
        guard fileManager.fileExists(atPath: paletteURL.path()) else {
            Logger.printText("⚠️ Missing palette file at \(paletteURL.path()) — falling back to remote/zip source")
            return nil
        }

        return SddsThemeSource(
            baseName: baseTenant.displayName,
            tenants: tenants,
            paletteURL: paletteURL
        )
    }

    private func resolve(path: String) -> URL {
        baseDirectory.appending(path: path)
    }

    private enum Constants {
        static let sddsDir = ".sdds"
        static let configFileName = "\(sddsDir)/config.json"
        static let defaultPalettePath = "\(sddsDir)/tenants/palette.json"
    }
}
