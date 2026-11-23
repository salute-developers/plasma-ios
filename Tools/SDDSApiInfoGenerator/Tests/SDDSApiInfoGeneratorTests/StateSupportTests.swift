import XCTest
@testable import SDDSApiInfoGenerator

final class StateSupportTests: XCTestCase {
    func testRawNamesAndCombinations() throws {
        let support = try StateSupport.load(
            runtimeSource: "enum InteractiveState: String { case pressed, hovered; case textInlined = \"text-inlined\" }",
            generatorSource: "enum ComponentState: String { case pressed, hovered; case textInlined = \"text-inlined\" }"
        )
        XCTAssertEqual(support.interactionStates, ["pressed", "hovered", "text-inlined"])
        XCTAssertTrue(support.combinations)
    }

    func testRejectsUntranslatableState() {
        XCTAssertThrowsError(try StateSupport.load(
            runtimeSource: "enum InteractiveState { case pressed }",
            generatorSource: "enum ComponentState { case pressed, disabled }"
        ))
        XCTAssertThrowsError(try StateSupport.load(runtimeSource: "", generatorSource: ""))
    }

    func testRepositoryEnumsAndArrayRoot() throws {
        let root = URL(fileURLWithPath: #filePath).deletingLastPathComponent()
            .deletingLastPathComponent().deletingLastPathComponent().deletingLastPathComponent()
            .deletingLastPathComponent()
        let support = try StateSupport.load(
            runtimeSource: String(contentsOf: root.appendingPathComponent("DesignSystemBuilder/SDDSThemeCore/Sources/SDDSThemeCore/Common/StatefulValue.swift")),
            generatorSource: String(contentsOf: root.appendingPathComponent("DesignSystemBuilder/DesignSystemBuilderCore/Model/ComponentConfiguration/KeyValue.swift"))
        )
        XCTAssertEqual(support.interactionStates.count, 12)
        XCTAssertTrue(support.interactionStates.contains("text-inlined"))
        let legacy = #"[{"componentName":"Button","qualifiedName":"ButtonAppearance","styleQualifiedName":"ButtonAppearance","resolvedTypes":[],"params":[]}]"#.data(using: .utf8)!
        var meta = try JSONDecoder().decode([ComponentApiMeta].self, from: legacy)
        XCTAssertNil(meta[0].stateSupport)
        meta[0].stateSupport = support
        let encoded = try JSONEncoder().encode(meta)
        let json = try XCTUnwrap(JSONSerialization.jsonObject(with: encoded) as? [[String: Any]])
        XCTAssertNotNil(json[0]["stateSupport"])
        XCTAssertEqual(try JSONDecoder().decode([ComponentApiMeta].self, from: encoded)[0].stateSupport, support)
    }
}
