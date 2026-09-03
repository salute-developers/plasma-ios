//
//  DocSampleScreenshotTests.swift
//
//  Съёмка скриншотов `@DocSample`-сэмплов для документационного бандла.
//  Это НЕ снапшот-верификация: тест рендерит каждый сэмпл из сгенерированного
//  реестра `DocSamples` под каждой темой и пишет PNG `<fqName_underscored>.png`.
//
//  Картинки хранятся в репозитории per-theme и оттуда попадают в бандл
//  (агрегатор берёт их флагом `--screenshots`):
//
//      Themes/<Тема>Theme/docs/screenshots/
//
//  Тема переключается через `EnvironmentValueProvider.shared` — общий провайдер
//  дефолтных appearance: каждая тема кладёт туда свои значения, а сэмплы, не
//  передающие appearance явно, их подхватывают. Сэмплы, где вариация — суть
//  примера (Image 1:1 / 16:9, Select single / multiple) либо где параметр
//  обязателен (CheckBoxGroup, RadioBoxGroup, Segment), остаются тема-зависимыми
//  и выглядят одинаково во всех темах.
//
//  Пересъёмка (аналог record-режима снапшотов) — корень репозитория задаётся
//  переменной, без неё тест пропускается, чтобы обычные прогоны не трогали
//  репозиторий:
//
//    TEST_RUNNER_DOCS_SCREENSHOTS_ROOT=$PWD \
//    xcodebuild test -project SDDSDemoApp/SDDSDemoApp.xcodeproj \
//      -scheme SDDSDemoAppTests -destination 'platform=iOS Simulator,name=iPhone 16' \
//      -only-testing:SDDSDemoAppTests/DocSampleScreenshotTests
//

import XCTest
import SwiftUI
import SDDSComponentsFixtures

final class DocSampleScreenshotTests: XCTestCase {

    /// Тема → каталог в репозитории.
    private let themes: [(directory: String, apply: () -> Void)] = [
        (SDDSServThemeDocCase.directoryName, SDDSServThemeDocCase.apply),
        (PlasmaHomeDSThemeDocCase.directoryName, PlasmaHomeDSThemeDocCase.apply),
        (PlasmaB2CThemeDocCase.directoryName, PlasmaB2CThemeDocCase.apply)
    ]

    func testCaptureDocSampleScreenshots() throws {
        guard let root = ProcessInfo.processInfo.environment["DOCS_SCREENSHOTS_ROOT"] else {
            throw XCTSkip("DOCS_SCREENSHOTS_ROOT не задан — съёмка скриншотов документации выключена")
        }
        let repoRoot = URL(fileURLWithPath: root)

        for theme in themes {
            theme.apply()

            let known = knownComponentPrefixes(repoRoot: repoRoot, theme: theme.directory)
            guard !known.isEmpty else {
                print("skip \(theme.directory): нет config-info-ios.json — тема не сгенерирована")
                continue
            }
            let outputURL = repoRoot.appending(path: "Themes/\(theme.directory)/docs/screenshots")
            try? FileManager.default.removeItem(at: outputURL)
            try FileManager.default.createDirectory(at: outputURL, withIntermediateDirectories: true)

            var captured = 0
            for entry in DocSamples.all where entry.needScreenshot {
                // Фильтр по components-info: префикс имени сэмпла до `_`,
                // без вспомогательного `SDDS`-префикса.
                let prefix = normalize(String(entry.id.split(separator: "_").first ?? ""))
                guard known.contains(where: { $0.contains(prefix) || prefix.contains($0) }) else { continue }

                guard let data = render(entry.makeView()).pngData() else {
                    XCTFail("не отрендерился \(entry.id) в теме \(theme.directory)")
                    continue
                }
                let filename = entry.fqName.replacingOccurrences(of: ".", with: "_") + ".png"
                try data.write(to: outputURL.appending(component: filename))
                captured += 1
            }
            XCTAssertGreaterThan(captured, 0, "в теме \(theme.directory) не снято ни одного сэмпла")
            print("doc screenshots: \(theme.directory) — \(captured) шт → \(outputURL.path)")
        }
    }

    // MARK: - Rendering

    private func render(_ view: AnyView) -> UIImage {
        let host = UIHostingController(rootView: view.padding().background(Color(.systemBackground)))
        // Safe area окна смещает контент и режет его при снятии по content-size.
        host.safeAreaRegions = []
        host.view.backgroundColor = .systemBackground

        let width: CGFloat = 375
        let target = host.sizeThatFits(in: CGSize(width: width, height: 10_000))
        let size = CGSize(width: width, height: max(target.height.rounded(.up), 44))

        let window = UIWindow(frame: CGRect(origin: .zero, size: size))
        window.rootViewController = host
        window.isHidden = false
        host.view.frame = window.bounds
        window.layoutIfNeeded()

        return UIGraphicsImageRenderer(size: size).image { _ in
            host.view.drawHierarchy(in: host.view.bounds, afterScreenUpdates: true)
        }
    }

    // MARK: - components-info filter

    /// Нормализованные `coreName`/`styleName` из config-info конкретной темы.
    /// Пустое множество = тема не сгенерирована, снимать нечего.
    private func knownComponentPrefixes(repoRoot: URL, theme: String) -> Set<String> {
        let configURL = repoRoot.appending(path: "Themes/\(theme)/.sdds/config-info-ios.json")
        struct Info: Decodable {
            struct Component: Decodable {
                let coreName: String
                let styleName: String
            }
            let components: [Component]
        }
        guard let data = try? Data(contentsOf: configURL),
              let info = try? JSONDecoder().decode(Info.self, from: data) else { return [] }
        var result = Set<String>()
        for component in info.components {
            result.insert(normalize(component.coreName))
            result.insert(normalize(component.styleName))
        }
        return result
    }

    private func normalize(_ value: String) -> String {
        value.lowercased()
            .replacingOccurrences(of: "sdds", with: "")
            .filter { $0.isLetter || $0.isNumber }
    }
}
