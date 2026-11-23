import CryptoKit
import Foundation

/// Сверка меты API стилей, с которой работает генератор, с iOS Core, выбранным для ДС.
///
/// `dsbuilder components fetch` кладёт в `.sdds/components/core-context.json` координаты
/// и SHA-256 исходной меты Core, на котором сохранены настройки ДС. Генератор же берёт
/// `ios-api-meta.json` рядом с бинарём или из репозитория. Если ДС закреплена на другой
/// версии Core, состав свойств может разойтись, поэтому расхождение показывается
/// предупреждением. Генерацию оно не останавливает: файл описывает происхождение данных,
/// а не требование к генератору.
enum CoreContextCheck {
    static let fileName = "core-context.json"

    /// Платформы, которые DS Builder сводит к iOS Core.
    private static let iosPlatforms: Set<String> = ["ios", "swiftui", "uikit"]

    enum Outcome: Equatable {
        /// Сверять не с чем: файла нет, в нём нет iOS Core или у Core нет SHA-256
        /// (технический снимок истории с неизвестным происхождением).
        case notChecked
        case match
        case mismatch(version: String?, expectedSha256: String, actualSha256: String)
    }

    private struct Context: Decodable {
        let coreReleases: [Release]
    }

    private struct Release: Decodable {
        let platform: String
        let version: String?
        let metaSha256: String?
    }

    /// `core-context.json` пакета компонентов рядом с `config.json` `.sdds`.
    static func contextURL(sddsConfigURL: URL) -> URL {
        sddsConfigURL
            .deletingLastPathComponent()
            .appending(component: "components")
            .appending(component: fileName)
    }

    static func compare(metaData: Data, contextURL: URL) -> Outcome {
        guard let data = try? Data(contentsOf: contextURL),
              let context = try? JSONDecoder().decode(Context.self, from: data),
              let release = context.coreReleases.first(where: { iosPlatforms.contains($0.platform.lowercased()) }),
              let expected = release.metaSha256?.lowercased(), !expected.isEmpty else {
            return .notChecked
        }
        let actual = sha256Hex(metaData)
        return actual == expected
            ? .match
            : .mismatch(version: release.version, expectedSha256: expected, actualSha256: actual)
    }

    static func warning(for outcome: Outcome, metaURL: URL, contextURL: URL) -> String? {
        guard case let .mismatch(version, expected, actual) = outcome else { return nil }
        let core = version.map { "iOS Core \($0)" } ?? "iOS Core"
        return """
        ⚠️ \(metaURL.path()) does not match \(core) selected for the design system \
        (\(contextURL.path())): metaSha256 \(actual.prefix(12)) instead of \(expected.prefix(12)). \
        Generated styles may not match the DS settings; use dsbuilder-ios built for that Core version.
        """
    }

    /// SHA-256 точных байтов файла, как его считает DS Builder при импорте меты.
    static func sha256Hex(_ data: Data) -> String {
        SHA256.hash(data: data).map { String(format: "%02x", $0) }.joined()
    }
}
