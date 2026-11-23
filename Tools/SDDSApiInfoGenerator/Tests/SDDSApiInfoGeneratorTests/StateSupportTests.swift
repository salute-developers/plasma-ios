import XCTest
@testable import SDDSApiInfoGenerator

final class StateSupportTests: XCTestCase {
    func testOnlyExplicitInteractionsAreGlobal() throws {
        let support = try StateSupport.load(
            runtimeSource: #"enum InteractiveState: String { case pressed, hovered; case textInlined = "text-inlined"; static let interactionStates: [InteractiveState] = [.pressed, .hovered] }"#,
            generatorSource: #"enum ComponentState: String { case pressed, hovered; case textInlined = "text-inlined" }"#
        )
        XCTAssertEqual(support.interactionStates, ["pressed", "hovered"])
        XCTAssertTrue(support.combinations)
    }

    func testRejectsMissingClassificationAndUntranslatableStates() {
        for runtime in ["enum InteractiveState { case pressed }",
                        "enum InteractiveState { case pressed; static let interactionStates: [InteractiveState] = [.unknown] }"] {
            XCTAssertThrowsError(try StateSupport.load(runtimeSource: runtime,
                generatorSource: "enum ComponentState { case pressed }"))
        }
        XCTAssertThrowsError(try StateSupport.load(runtimeSource: "", generatorSource: ""))
        XCTAssertThrowsError(try StateSupport.load(
            runtimeSource: "enum InteractiveState { case pressed; static let interactionStates: [InteractiveState] = [.pressed] }",
            generatorSource: "enum ComponentState { case pressed, disabled }"
        ))
    }

    func testRepositoryEnumsAndArrayRoot() throws {
        let root = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            .deletingLastPathComponent()
        let support = try StateSupport.load(
            runtimeSource: String(contentsOf: root.appendingPathComponent("DesignSystemBuilder/SDDSThemeCore/Sources/SDDSThemeCore/Common/StatefulValue.swift")),
            generatorSource: String(contentsOf: root.appendingPathComponent("DesignSystemBuilder/DesignSystemBuilderCore/Model/ComponentConfiguration/KeyValue.swift"))
        )
        XCTAssertEqual(support.interactionStates, ["pressed", "hovered", "focused", "selected", "activated"])
        let legacy = #"[{"componentName":"Button","qualifiedName":"ButtonAppearance","styleQualifiedName":"ButtonAppearance","resolvedTypes":[],"params":[]}]"#.data(using: .utf8)!
        var meta = try JSONDecoder().decode([ComponentApiMeta].self, from: legacy)
        XCTAssertNil(meta[0].stateSupport)
        meta[0].stateSupport = support
        let encoded = try JSONEncoder().encode(meta)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: encoded) as? [[String: Any]])
        XCTAssertNotNil(json[0]["stateSupport"])
        XCTAssertEqual(try JSONDecoder().decode([ComponentApiMeta].self, from: encoded)[0].stateSupport, support)
    }

    func testCLIFromDifferentDirectoryReportsMissingOptionsAndFiles() throws {
        var directory = Bundle(for: StateSupportTests.self).bundleURL.deletingLastPathComponent()
        var binary: URL?
        for _ in 0..<6 {
            let candidate = directory.appendingPathComponent("SDDSApiInfoGenerator")
            if FileManager.default.isExecutableFile(atPath: candidate.path) { binary = candidate; break }
            directory.deleteLastPathComponent()
        }
        let executable = try XCTUnwrap(binary)
        let temporary = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
        try FileManager.default.createDirectory(at: temporary, withIntermediateDirectories: true)
        defer { try? FileManager.default.removeItem(at: temporary) }
        for extra in [[], ["--runtime-states", "missing-runtime.swift", "--generator-states", "missing-generator.swift"]] {
            let process = Process()
            let errors = Pipe()
            process.executableURL = executable
            process.currentDirectoryURL = temporary
            process.arguments = ["--sources", temporary.path, "--props", ""] + extra
            process.standardError = errors
            process.standardOutput = Pipe()
            try process.run()
            process.waitUntilExit()
            let diagnostic = String(decoding: errors.fileHandleForReading.readDataToEndOfFile(), as: UTF8.self)
            XCTAssertEqual(process.terminationReason, .exit)
            XCTAssertEqual(process.terminationStatus, 2, diagnostic)
            XCTAssertTrue(diagnostic.contains("error:"), diagnostic)
            if extra.isEmpty { XCTAssertTrue(diagnostic.contains("--runtime-states"), diagnostic) }
        }
    }

    func testComponentStatesRemainScoped() {
        let table = SymbolTable()
        table.ingest(source: """
        @ApiInfo struct ButtonAppearance { var color: StatefulFillStyle }
        @ApiInfo @ApiStates(.checked) struct SwitchAppearance { var color: StatefulFillStyle }
        @ApiInfo @ApiStates(.readonly) struct EditableAppearance { var color: StatefulFillStyle }
        """)
        let components = Scanner(table: table, moduleName: "Fixtures").scan(only: nil)
        XCTAssertNil(components.first { $0.componentName == "Button" }?.stateEnum)
        XCTAssertEqual(components.first { $0.componentName == "Switch" }?.stateEnum?.values.map(\.configName), ["checked"])
        XCTAssertEqual(components.first { $0.componentName == "Editable" }?.stateEnum?.values.map(\.configName), ["readonly"])
    }
}
