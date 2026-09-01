import Foundation

/// Забирает архив исходников SDDS, опубликованный на GitHub Release, и распаковывает
/// его туда же, куда CLI генерирует токены и стили компонентов.
///
/// Закрывает последнюю завязку standalone-режима на репозиторий: клиенту достаточно
/// бинаря CLI и номера версии — исходники, из которых собирается бандл
/// (`SDDSThemeCore`, `SDDSComponents`, `SDDSIcons`, `Vendor/InputMask`, пакеты
/// `Themes/<Name>Theme`), приезжают с релиза.
///
/// Архив собирает `scripts/package_sources.sh` и сохраняет в нём дерево путей
/// репозитория, поэтому распакованный корень годится на роль `--sources-root` как есть.
public struct SourcesReleaseFetcher {
    /// Версия исходников = git-тег релиза (`release-18-08-2026`).
    let version: String
    /// Куда распаковывать — директория, в которую CLI пишет сгенерированные темы.
    let destinationDirectory: URL
    /// Явный адрес архива (`--sources-url`), в том числе `file://`. Если задан,
    /// адрес по `repository`/`version` не вычисляется.
    var archiveURL: URL?
    /// GitHub-репозиторий с релизами в форме `owner/repo`.
    var repository: String = SourcesReleaseFetcher.defaultRepository

    public static let defaultRepository = "salute-developers/plasma-ios"

    /// Путь внутри распакованного архива, по которому проверяется, что мы получили
    /// именно дерево исходников, а не что-то другое: `--sources-root` без него
    /// молча собрал бы пустой бандл.
    static let layoutMarker = "SDDSComponents/Sources/SDDSComponents"

    static func archiveName(version: String) -> String {
        "SDDSSources-\(version).zip"
    }

    static func directoryName(version: String) -> String {
        "SDDSSources-\(version)"
    }

    /// Корень распакованных исходников: `<destination>/SDDSSources-<version>`.
    var sourcesRootURL: URL {
        destinationDirectory.appending(component: Self.directoryName(version: version))
    }

    var resolvedArchiveURL: URL {
        if let archiveURL = archiveURL {
            return archiveURL
        }
        let string = "https://github.com/\(repository)/releases/download/\(version)/\(Self.archiveName(version: version))"
        guard let url = URL(string: string) else {
            Logger.terminate("Не удалось построить URL архива исходников из версии '\(version)' и репозитория '\(repository)'")
        }
        return url
    }

    /// Возвращает корень исходников, скачивая и распаковывая архив при необходимости.
    /// Повторный запуск с той же версией ничего не качает: готовое дерево переиспользуется.
    func resolve() -> URL {
        let root = sourcesRootURL
        if isUnpacked(root) {
            Logger.printText("📦 Исходники \(version) уже распакованы: \(root.path())")
            return root
        }

        let fileManager = FileManager.default
        try? fileManager.createDirectory(at: destinationDirectory, withIntermediateDirectories: true)

        // Архив от прерванного запуска мог остаться недокачанным, а `DownloadCommand`
        // считает существующий файл готовым — качаем начисто.
        let archiveDestination = destinationDirectory.appending(component: Self.archiveName(version: version))
        try? fileManager.removeItem(at: archiveDestination)

        Logger.printText("⬇️  Загружаю исходники \(version): \(resolvedArchiveURL.absoluteString)")
        let download = DownloadCommand(fileURL: resolvedArchiveURL, outputURL: archiveDestination).run()
        if download.isError || !fileManager.fileExists(atPath: archiveDestination.path()) {
            try? fileManager.removeItem(at: archiveDestination)
            Logger.terminate("Не удалось скачать архив исходников \(resolvedArchiveURL.absoluteString). Проверьте версию (тег релиза) и доступность релиза.")
        }

        unpack(archive: archiveDestination, into: root)
        try? fileManager.removeItem(at: archiveDestination)

        Logger.printText("📦 Исходники \(version) распакованы: \(root.path())")
        return root
    }

    private func isUnpacked(_ root: URL) -> Bool {
        FileManager.default.fileExists(atPath: root.appending(path: Self.layoutMarker).path())
    }

    /// Распаковывает во временную папку рядом с целевой, находит внутри корень дерева
    /// исходников (архив может нести верхнюю папку-обёртку) и перемещает его на место.
    /// Промежуточная папка нужна, чтобы прерванная распаковка не оставила после себя
    /// корень, который следующий запуск примет за готовый.
    private func unpack(archive: URL, into root: URL) {
        let fileManager = FileManager.default
        let staging = destinationDirectory.appending(component: ".\(Self.directoryName(version: version)).unpack")
        try? fileManager.removeItem(at: staging)
        try? fileManager.removeItem(at: root)

        do {
            try fileManager.createDirectory(at: staging, withIntermediateDirectories: true)
            let process = Process()
            process.executableURL = URL(fileURLWithPath: "/usr/bin/unzip")
            process.arguments = ["-q", "-o", archive.path(), "-d", staging.path()]
            try process.run()
            process.waitUntilExit()
            guard process.terminationStatus == 0 else {
                Logger.terminate("Не удалось распаковать архив исходников \(archive.path()) (unzip вернул \(process.terminationStatus))")
            }

            guard let unpackedRoot = layoutRoot(in: staging) else {
                Logger.terminate("В архиве исходников \(archive.lastPathComponent) нет ожидаемого дерева '\(Self.layoutMarker)' — архив собран не тем скриптом или повреждён.")
            }
            try fileManager.moveItem(at: unpackedRoot, to: root)
        } catch {
            Logger.terminate("Не удалось подготовить исходники \(version): \(error.localizedDescription)")
        }

        try? fileManager.removeItem(at: staging)
    }

    /// Директория, от которой резолвится `layoutMarker`: сама распакованная папка либо
    /// её единственный потомок (архив, собранный с верхней папкой-обёрткой).
    private func layoutRoot(in directory: URL) -> URL? {
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: directory.appending(path: Self.layoutMarker).path()) {
            return directory
        }
        let children = (try? fileManager.contentsOfDirectory(at: directory, includingPropertiesForKeys: nil)) ?? []
        return children.first { child in
            fileManager.fileExists(atPath: child.appending(path: Self.layoutMarker).path())
        }
    }
}
