import XCTest
@testable import DocsAggregatorCore

final class DocCommentSyncerTests: XCTestCase {

    private let snippets = [
        "SDDSCard_Simple.swift": "SDDSCard {\n    Text(\"Header\")\n}",
        "Multi_Line.swift": "VStack {\n\n    Text(\"a\")\n}"
    ]

    private func sync(_ source: String) throws -> String {
        try DocCommentSyncer.sync(source: source, snippetsByBasename: snippets, file: "T.swift").text
    }

    // MARK: - /** */

    func test_replacesBodyInBlockDocComment() throws {
        let source = """
        /**
         ## Example

         ```swift
         // @sample: Samples/Card/SDDSCard_Simple.swift
         old code that must go
         ```
         */
        public struct Card {}
        """

        XCTAssertEqual(try sync(source), """
        /**
         ## Example

         ```swift
         // @sample: Samples/Card/SDDSCard_Simple.swift
         SDDSCard {
             Text("Header")
         }
         ```
         */
        public struct Card {}
        """)
    }

    // MARK: - ///

    func test_replacesBodyInLineDocComment() throws {
        let source = """
        /// ## Example
        ///
        /// ```swift
        /// // @sample: Samples/Card/SDDSCard_Simple.swift
        /// stale
        /// ```
        public struct Card {}
        """

        XCTAssertEqual(try sync(source), """
        /// ## Example
        ///
        /// ```swift
        /// // @sample: Samples/Card/SDDSCard_Simple.swift
        /// SDDSCard {
        ///     Text("Header")
        /// }
        /// ```
        public struct Card {}
        """)
    }

    // MARK: - Отступ и пустые строки

    func test_keepsCommentIndentAndDoesNotLeaveTrailingWhitespace() throws {
        let source = """
        struct Outer {
            /**
             ```swift
             // @sample: Multi_Line.swift
             ```
             */
            func make() {}
        }
        """
        let result = try sync(source)

        // Маркер стоит с отступом в 5 пробелов — сниппет получает его же,
        // а собственный отступ строк сниппета добавляется сверху.
        XCTAssertTrue(result.contains("\n     VStack {\n"), result)
        XCTAssertTrue(result.contains("\n         Text(\"a\")\n"), result)
        XCTAssertTrue(result.contains("\n     }\n"), result)
        // Пустая строка внутри сниппета не должна тащить отступ комментария.
        for line in result.components(separatedBy: "\n") {
            XCTAssertFalse(line.hasSuffix(" "), "хвостовой пробел в строке: '\(line)'")
        }
    }

    // MARK: - Идемпотентность

    func test_secondRunChangesNothing() throws {
        let source = """
        /**
         ```swift
         // @sample: Samples/Card/SDDSCard_Simple.swift
         whatever
         ```
         */
        struct Card {}
        """
        let once = try sync(source)
        XCTAssertEqual(try sync(once), once)
    }

    // MARK: - Ошибки и границы

    func test_throwsOnUnknownSample() {
        let source = """
        /**
         ```swift
         // @sample: Samples/Nope/Missing.swift
         ```
         */
        struct Card {}
        """
        XCTAssertThrowsError(try sync(source)) { error in
            guard case let DocCommentSyncer.SyncError.unresolvedSample(file, line, marker) = error else {
                return XCTFail("ожидалась unresolvedSample, получено \(error)")
            }
            XCTAssertEqual(file, "T.swift")
            XCTAssertEqual(line, 3)
            XCTAssertEqual(marker, "Samples/Nope/Missing.swift")
        }
    }

    func test_ignoresMarkerOutsideDocComment() throws {
        // Обычный `//`-комментарий документацией не является — трогать его нельзя.
        let source = """
        struct Card {
            // @sample: Samples/Card/SDDSCard_Simple.swift
            let value = 1
        }
        """
        XCTAssertEqual(try sync(source), source)
    }

    func test_ignoresMarkerInsideStringLiteral() throws {
        let source = #"""
        struct Card {
            let text = "/** ```swift\n// @sample: Samples/Card/SDDSCard_Simple.swift\n``` */"
        }
        """#
        XCTAssertEqual(try sync(source), source)
    }

    func test_leavesMarkerAloneWhenFenceIsNotClosed() throws {
        let source = """
        /**
         ```swift
         // @sample: Samples/Card/SDDSCard_Simple.swift
         */
        struct Card {}
        """
        XCTAssertEqual(try sync(source), source)
    }

    func test_reportsMarkerCount() throws {
        let source = """
        /**
         ```swift
         // @sample: Samples/Card/SDDSCard_Simple.swift
         ```
         ```swift
         // @sample: Multi_Line.swift
         ```
         */
        struct Card {}
        """
        let result = try DocCommentSyncer.sync(source: source, snippetsByBasename: snippets, file: "T.swift")
        XCTAssertEqual(result.markers, 2)
    }

    func test_sourceWithoutDocCommentsIsUntouched() throws {
        let source = "struct Card {}\n"
        XCTAssertEqual(try sync(source), source)
    }
}
