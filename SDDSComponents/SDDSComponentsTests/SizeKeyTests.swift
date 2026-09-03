import XCTest
@testable import SDDSComponents

/// `sizeKey` maps the short size identifiers used by the design-token config onto the long
/// names used in generated theme code.
final class SizeKeyTests: XCTestCase {

    func testMapsKnownSizes() {
        XCTAssertEqual("xxs".sizeKey, "extraExtraSmall")
        XCTAssertEqual("xs".sizeKey, "extraSmall")
        XCTAssertEqual("s".sizeKey, "small")
        XCTAssertEqual("m".sizeKey, "medium")
        XCTAssertEqual("l".sizeKey, "large")
    }

    func testUnknownSizeFallsBackToASentinelRatherThanCrashing() {
        XCTAssertEqual("xl".sizeKey, "unknownSize")
        XCTAssertEqual("".sizeKey, "unknownSize")
    }

    func testMappingIsCaseSensitive() {
        XCTAssertEqual("M".sizeKey, "unknownSize")
    }
}
