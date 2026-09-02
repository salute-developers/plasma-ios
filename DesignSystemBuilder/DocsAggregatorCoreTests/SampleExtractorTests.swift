import XCTest
@testable import DocsAggregatorCore

final class SampleExtractorTests: XCTestCase {

    // MARK: - Marker parsing

    func test_marker_bareForm() {
        let marker = DocSampleMarker.parse(commentText: "// @DocSample")
        XCTAssertEqual(marker, DocSampleMarker(id: nil, needScreenshot: true))
    }

    func test_marker_withIdAndNeedScreenshot() {
        let marker = DocSampleMarker.parse(commentText: "// @DocSample id=custom_id needScreenshot=false")
        XCTAssertEqual(marker, DocSampleMarker(id: "custom_id", needScreenshot: false))
    }

    func test_marker_rejectsUnrelatedComment() {
        XCTAssertNil(DocSampleMarker.parse(commentText: "// @DocSampleXyz"))
        XCTAssertNil(DocSampleMarker.parse(commentText: "// обычный комментарий"))
        XCTAssertNil(DocSampleMarker.parse(commentText: "/* @DocSample */"))
    }

    // MARK: - View body extraction

    func test_extract_viewBody() {
        let source = """
        import SwiftUI

        // @DocSample
        struct BasicButton_Simple: View {
            var body: some View {
                BasicButton(
                    title: "Label",
                    action: {}
                )
            }
        }
        """
        let samples = SampleExtractor.extract(source: source)
        XCTAssertEqual(samples.count, 1)
        let sample = samples[0]
        XCTAssertEqual(sample.name, "BasicButton_Simple")
        XCTAssertEqual(sample.kind, "view")
        XCTAssertEqual(sample.snippet, """
        BasicButton(
            title: "Label",
            action: {}
        )
        """)
    }

    func test_extract_ignoresUnmarkedStruct() {
        let source = """
        struct NotASample: View {
            var body: some View { Text("x") }
        }
        """
        XCTAssertTrue(SampleExtractor.extract(source: source).isEmpty)
    }

    func test_extract_functionBody() {
        let source = """
        // @DocSample
        func makeAppearance() {
            let appearance = BasicButton.l.accent.appearance
            print(appearance)
        }
        """
        let samples = SampleExtractor.extract(source: source)
        XCTAssertEqual(samples.count, 1)
        XCTAssertEqual(samples[0].kind, "regular")
        XCTAssertTrue(samples[0].snippet.hasPrefix("let appearance"))
    }

    // MARK: - swiftCodeSnippet unwrap

    func test_extract_unwrapsSwiftCodeSnippet() {
        let source = """
        // @DocSample
        struct BasicButton_Snippet: View {
            var body: some View {
                swiftCodeSnippet {
                    BasicButton(title: "Label")
                }
            }
        }
        """
        let samples = SampleExtractor.extract(source: source)
        XCTAssertEqual(samples[0].snippet, "BasicButton(title: \"Label\")")
    }

    func test_extract_bracesInStringLiterals_doNotBreakUnwrap() {
        // Слабое место старого awk-экстрактора: скобки внутри строковых литералов.
        let source = """
        // @DocSample
        struct Sample_Braces: View {
            var body: some View {
                swiftCodeSnippet {
                    Text("closing } brace { inside")
                }
            }
        }
        """
        let samples = SampleExtractor.extract(source: source)
        XCTAssertEqual(samples[0].snippet, "Text(\"closing } brace { inside\")")
    }

    // MARK: - placeholder collapse

    func test_extract_collapsesPlaceholder() {
        let source = """
        // @DocSample
        struct Sample_Placeholder: View {
            var body: some View {
                BasicButton(
                    title: placeholder("Label", "Основной текст"),
                    action: {}
                )
            }
        }
        """
        let samples = SampleExtractor.extract(source: source)
        XCTAssertTrue(samples[0].snippet.contains("title: \"Основной текст\","))
        XCTAssertFalse(samples[0].snippet.contains("placeholder"))
    }

    // MARK: - Offsets

    func test_offsets_pointIntoOriginalSource() {
        let source = """
        // @DocSample
        struct Sample_Offsets: View {
            var body: some View {
                Text("marker")
            }
        }
        """
        let sample = SampleExtractor.extract(source: source)[0]
        let data = Data(source.utf8)
        let fragment = String(data: data[sample.startOffset..<sample.endOffset], encoding: .utf8)
        XCTAssertEqual(fragment, "Text(\"marker\")")
    }

    // MARK: - Multiple samples per file

    func test_extract_multipleSamplesInOneFile() {
        let source = """
        // @DocSample
        struct A_Simple: View { var body: some View { Text("a") } }

        struct Helper {}

        // @DocSample
        struct B_Simple: View { var body: some View { Text("b") } }
        """
        let names = SampleExtractor.extract(source: source).map(\.name)
        XCTAssertEqual(names, ["A_Simple", "B_Simple"])
    }
}
