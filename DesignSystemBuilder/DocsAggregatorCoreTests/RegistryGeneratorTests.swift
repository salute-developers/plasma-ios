import XCTest
@testable import DocsAggregatorCore

final class RegistryGeneratorTests: XCTestCase {

    func test_registry_containsViewSamplesOnly() {
        let records = [
            SampleRecord(id: "Badge_Simple", kind: "view",
                         fqName: "SDDSComponentsFixtures.Badge.Badge_Simple",
                         file: "f.swift", snippetPath: "swift/x/Badge_Simple.swift",
                         snippetStartOffset: 0, snippetEndOffset: 1),
            SampleRecord(id: "helper", kind: "regular",
                         fqName: "SDDSComponentsFixtures.Badge.helper",
                         file: "f.swift", snippetPath: "swift/x/helper.swift",
                         snippetStartOffset: 0, snippetEndOffset: 1, needScreenshot: false)
        ]
        let source = RegistryGenerator.source(records: records)
        XCTAssertTrue(source.contains("AnyView(Badge_Simple())"))
        XCTAssertFalse(source.contains("helper()"))
        XCTAssertTrue(source.contains("needScreenshot: true"))
    }

    func test_registry_usesTypeNameFromFqNameWhenIdOverridden() {
        let records = [
            SampleRecord(id: "custom_id", kind: "view",
                         fqName: "M.Comp.RealTypeName",
                         file: "f.swift", snippetPath: "swift/x/custom_id.swift",
                         snippetStartOffset: 0, snippetEndOffset: 1)
        ]
        let source = RegistryGenerator.source(records: records)
        XCTAssertTrue(source.contains("AnyView(RealTypeName())"))
        XCTAssertTrue(source.contains("id: \"custom_id\""))
    }
}
