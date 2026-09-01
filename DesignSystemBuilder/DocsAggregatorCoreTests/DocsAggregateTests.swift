import XCTest
@testable import DocsAggregatorCore

final class DocsAggregateTests: XCTestCase {

    private var workDirectory: URL!

    override func setUpWithError() throws {
        workDirectory = FileManager.default.temporaryDirectory
            .appending(component: "DocsAggregateTests-\(UUID().uuidString)")
        try FileManager.default.createDirectory(at: workDirectory, withIntermediateDirectories: true)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: workDirectory)
    }

    // MARK: - MarkerRenderer

    func test_sampleMarker_isInlined() throws {
        let renderer = MarkerRenderer(
            snippets: ["swift/M/Comp/Sample_One.swift": "Text(\"inlined\")"],
            componentsInfo: nil
        )
        let markdown = """
        ```swift
        // @sample: SDDSComponentsFixtures/Samples/Comp/Sample_One.swift
        ```
        """
        let rendered = try renderer.render(page: "components/CompUsage.md", markdown: markdown)
        XCTAssertTrue(rendered.contains("Text(\"inlined\")"))
        XCTAssertFalse(rendered.contains("@sample"))
    }

    func test_unresolvedSampleMarker_throws() {
        let renderer = MarkerRenderer(snippets: [:], componentsInfo: nil)
        XCTAssertThrowsError(try renderer.render(
            page: "components/CompUsage.md",
            markdown: "// @sample: Missing.swift"
        )) { error in
            guard case AggregationError.unresolvedSample = error else {
                return XCTFail("ожидалась unresolvedSample, получено \(error)")
            }
        }
    }

    func test_screenshotMarker_isPassthrough() throws {
        let renderer = MarkerRenderer(snippets: [:], componentsInfo: nil)
        let markdown = "<!-- @screenshot: SDDSComponentsFixtures.Button.BasicButton_Simple -->"
        let rendered = try renderer.render(page: "p.md", markdown: markdown)
        XCTAssertEqual(rendered, markdown)
    }

    func test_styleApiMarker_rendersTableFromComponentsInfo() throws {
        let renderer = MarkerRenderer(snippets: [:], componentsInfo: .init(components: [badge(withStyleApi: true)]))
        let rendered = try renderer.render(page: "components/BadgeUsage.md", markdown: "<!-- @style-api -->")
        XCTAssertTrue(rendered.contains("| `size` | `BadgeStyles.Size` | `.l`, `.m` |"),
                      "значения — Swift-кейсы (строчная первая буква), а не codeName")
        XCTAssertTrue(rendered.contains("let appearance = BadgeStyles.style("))
        XCTAssertTrue(rendered.contains(").appearance"), "результат применяют через .appearance")
        XCTAssertTrue(rendered.contains("size: .l"))
        XCTAssertTrue(rendered.contains("Badge.l.default.appearance"))
    }

    /// Компонент в дизайн-системе есть, но готовых стилей у него нет.
    func test_styleApiMarker_componentWithoutStyleApi_rendersWarning() throws {
        let renderer = MarkerRenderer(snippets: [:], componentsInfo: .init(components: [badge(withStyleApi: false)]))
        let rendered = try renderer.render(page: "components/BadgeUsage.md", markdown: "<!-- @style-api -->")
        XCTAssertTrue(rendered.contains(":::warning"))
        XCTAssertTrue(rendered.contains("нет готовых стилей"))
    }

    /// Компонента нет в components-info — предупреждение, а не падение сборки.
    func test_styleApiMarker_unknownComponent_rendersWarningInsteadOfThrowing() throws {
        let renderer = MarkerRenderer(snippets: [:], componentsInfo: .init(components: []))
        let rendered = try renderer.render(page: "components/GhostUsage.md", markdown: "<!-- @style-api -->")
        XCTAssertTrue(rendered.contains(":::warning"))
        XCTAssertTrue(rendered.contains("нет готовых стилей"))
    }

    private func badge(withStyleApi: Bool) -> ComponentsInfoLite.Component {
        .init(
            key: "badge",
            coreName: "Badge",
            styleName: "Badge",
            styleApi: withStyleApi ? .init(
                stylesClassName: "BadgeStyles",
                returnTypeName: "AppearanceVariation<BadgeAppearance>",
                params: [.init(
                    name: "size",
                    type: "enum",
                    typeName: "BadgeStyles.Size",
                    values: [.init(value: "l", codeName: "L"), .init(value: "m", codeName: "M")]
                )]
            ) : nil,
            variations: [.init(name: "l.default", reference: "Badge.L.Default")]
        )
    }

    // MARK: - DocsAggregate: layout + errors

    func test_aggregate_producesFullLayout() throws {
        let inputs = try makeInputs()
        let outputURL = workDirectory.appending(component: "out")
        let report = try DocsAggregate().run(inputs: inputs, outputURL: outputURL)

        XCTAssertEqual(report.pagesCore, 1)
        for path in [
            "content/core/page.md", "structure-core.json", "structure-user.json",
            "meta/components-info.json", "meta/theme-info.json", "meta/samples.json",
            "meta/platform-context.json", "assets/examples", "assets/screenshots"
        ] {
            XCTAssertTrue(
                FileManager.default.fileExists(atPath: outputURL.appending(path: path).path),
                "отсутствует \(path)"
            )
        }
        let context = try JSONSerialization.jsonObject(
            with: Data(contentsOf: outputURL.appending(path: "meta/platform-context.json"))
        ) as? [String: Any]
        XCTAssertEqual(context?["platform"] as? String, "swiftui")
    }

    /// dsbuilder падает без `schemaVersion` в structure-*.json — проверено живым CLI.
    func test_aggregate_structuresCarrySchemaVersion() throws {
        let inputs = try makeInputs()
        let outputURL = workDirectory.appending(component: "out")
        try DocsAggregate().run(inputs: inputs, outputURL: outputURL)

        for name in ["structure-core.json", "structure-user.json"] {
            let json = try JSONSerialization.jsonObject(
                with: Data(contentsOf: outputURL.appending(component: name))
            ) as? [String: Any]
            XCTAssertEqual(json?["schemaVersion"] as? String, "1.0", "\(name) без schemaVersion")
        }
    }

    func test_aggregate_missingStructurePage_throws() throws {
        let inputs = try makeInputs(structurePages: ["page.md", "ghost.md"])
        XCTAssertThrowsError(
            try DocsAggregate().run(inputs: inputs, outputURL: workDirectory.appending(component: "out"))
        ) { error in
            guard case AggregationError.structurePageMissing = error else {
                return XCTFail("ожидалась structurePageMissing, получено \(error)")
            }
        }
    }

    func test_aggregate_userPrependRejected() throws {
        var inputs = try makeInputs()
        let userURL = workDirectory.appending(component: "user-docs")
        try write("## user", to: userURL.appending(component: "extra.md"))
        try write(
            #"{"navigation":[{"title":"X","path":"extra.md","merge":"prepend"}]}"#,
            to: userURL.appending(component: "structure.json")
        )
        inputs.userDocsURL = userURL
        XCTAssertThrowsError(
            try DocsAggregate().run(inputs: inputs, outputURL: workDirectory.appending(component: "out"))
        ) { error in
            guard case AggregationError.userMergePrependRejected = error else {
                return XCTFail("ожидалась userMergePrependRejected, получено \(error)")
            }
        }
    }

    func test_aggregate_userAppendRequiresPlusPrefix() throws {
        var inputs = try makeInputs()
        let userURL = workDirectory.appending(component: "user-docs")
        try write("## user", to: userURL.appending(component: "extra.md"))
        try write(
            #"{"navigation":[{"title":"X","path":"extra.md","merge":"append"}]}"#,
            to: userURL.appending(component: "structure.json")
        )
        inputs.userDocsURL = userURL
        XCTAssertThrowsError(
            try DocsAggregate().run(inputs: inputs, outputURL: workDirectory.appending(component: "out"))
        ) { error in
            guard case AggregationError.userAppendRequiresPlusPrefix = error else {
                return XCTFail("ожидалась userAppendRequiresPlusPrefix, получено \(error)")
            }
        }
    }

    func test_aggregate_userAppendWithPlusPrefix_isRendered() throws {
        var inputs = try makeInputs()
        let userURL = workDirectory.appending(component: "user-docs")
        try write("## user layer", to: userURL.appending(component: "+extra.md"))
        try write(
            #"{"navigation":[{"title":"X","path":"+extra.md","merge":"append"}]}"#,
            to: userURL.appending(component: "structure.json")
        )
        inputs.userDocsURL = userURL
        let outputURL = workDirectory.appending(component: "out")
        let report = try DocsAggregate().run(inputs: inputs, outputURL: outputURL)
        XCTAssertEqual(report.pagesUser, 1)
        XCTAssertTrue(FileManager.default.fileExists(
            atPath: outputURL.appending(path: "content/user/+extra.md").path
        ))
    }

    /// Маркеры @screenshot без единого png — битые ссылки у потребителя бандла.
    func test_aggregate_screenshotMarkersWithoutFiles_areReported() throws {
        var inputs = try makeInputs()
        try write("# Page\n\n<!-- @screenshot: M.Comp.Sample_One -->",
                  to: inputs.coreDocsURL.appending(component: "page.md"))
        inputs.screenshotsURL = nil

        let report = try DocsAggregate().run(
            inputs: inputs,
            outputURL: workDirectory.appending(component: "out")
        )
        XCTAssertEqual(report.screenshotMarkers.count, 1)
        XCTAssertEqual(report.screenshotFiles, 0)
        XCTAssertTrue(report.warnings.contains { $0.contains("@screenshot") },
                      "агрегатор должен предупредить о маркерах без картинок")
    }

    func test_aggregate_screenshotsAreCopied() throws {
        var inputs = try makeInputs()
        try write("# Page\n\n<!-- @screenshot: M.Comp.Sample_One -->",
                  to: inputs.coreDocsURL.appending(component: "page.md"))
        let shots = workDirectory.appending(component: "shots")
        try write("png", to: shots.appending(component: "M_Comp_Sample_One.png"))
        inputs.screenshotsURL = shots

        let outputURL = workDirectory.appending(component: "out")
        let report = try DocsAggregate().run(inputs: inputs, outputURL: outputURL)
        XCTAssertEqual(report.screenshotFiles, 1)
        XCTAssertTrue(report.warnings.isEmpty, "предупреждений быть не должно: \(report.warnings)")
        XCTAssertTrue(FileManager.default.fileExists(
            atPath: outputURL.appending(path: "assets/screenshots/M_Comp_Sample_One.png").path))
    }

    func test_aggregate_orphanPage_isReportedAsWarning() throws {
        let inputs = try makeInputs()
        try write("## orphan", to: inputs.coreDocsURL.appending(component: "orphan.md"))
        let report = try DocsAggregate().run(
            inputs: inputs,
            outputURL: workDirectory.appending(component: "out")
        )
        XCTAssertTrue(report.warnings.contains { $0.contains("orphan.md") })
    }

    // MARK: - Fixture helpers

    private func makeInputs(structurePages: [String] = ["page.md"]) throws -> DocsAggregate.Inputs {
        let coreURL = workDirectory.appending(component: "core-docs")
        try write("# Page\n\nтекст", to: coreURL.appending(component: "page.md"))
        let nav = structurePages
            .map { #"{"title":"P","path":"\#($0)"}"# }
            .joined(separator: ",")
        try write(#"{"navigation":[\#(nav)]}"#, to: coreURL.appending(component: "structure.json"))

        let componentsInfoURL = workDirectory.appending(component: "config-info-ios.json")
        try write(#"{"name":"T","packageName":"T","components":[]}"#, to: componentsInfoURL)
        let themeInfoURL = workDirectory.appending(component: "config-info-tokens-ios.json")
        try write(#"{"name":"T","version":"latest","tokens":[]}"#, to: themeInfoURL)

        let samplesURL = workDirectory.appending(component: "extracted")
        try write("[]", to: samplesURL.appending(component: "samples.json"))
        try write("Text(\"x\")", to: samplesURL.appending(path: "swift/M/Sample_One.swift"))

        return DocsAggregate.Inputs(
            coreDocsURL: coreURL,
            componentsInfoURL: componentsInfoURL,
            themeInfoURL: themeInfoURL,
            extractedSamplesURL: samplesURL,
            artifactId: "sdds-test-swiftui",
            artifactVersion: "0.0.1"
        )
    }

    private func write(_ text: String, to url: URL) throws {
        try FileManager.default.createDirectory(
            at: url.deletingLastPathComponent(),
            withIntermediateDirectories: true
        )
        try text.data(using: .utf8)!.write(to: url)
    }
}
