import XCTest
@testable import SDDSComponents

/// Smoke test: the library links and its public entry points are reachable from a test target.
final class SDDSComponentsTests: XCTestCase {

    func testComponentsBundleIsResolvable() {
        // `Components` is the bundle anchor components use to load their own resources.
        let bundle = Bundle(for: Components.self)

        XCTAssertNotNil(bundle.bundleIdentifier ?? bundle.bundlePath)
    }
}
