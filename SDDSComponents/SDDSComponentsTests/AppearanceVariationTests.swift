import XCTest
@testable import SDDSComponents

/// The variation wrappers compare and hash by `name` only — two variations with the same name
/// are equal even if their appearances differ. Themes rely on this to swap appearances while
/// keeping identity stable, so it is deliberate rather than an oversight.
final class AppearanceVariationTests: XCTestCase {

    private struct TestAppearance: Equatable {
        var size: Int
    }

    // MARK: - AppearanceVariation

    func testAppearanceVariationIdIsItsName() {
        let variation = AppearanceVariation(name: "accent", appearance: TestAppearance(size: 1))

        XCTAssertEqual(variation.id, "accent")
    }

    func testAppearanceVariationsWithSameNameAreEqualDespiteDifferentAppearances() {
        let lhs = AppearanceVariation(name: "accent", appearance: TestAppearance(size: 1))
        let rhs = AppearanceVariation(name: "accent", appearance: TestAppearance(size: 2))

        XCTAssertEqual(lhs, rhs)
        XCTAssertEqual(lhs.hashValue, rhs.hashValue)
        XCTAssertNotEqual(lhs.appearance, rhs.appearance)
    }

    func testAppearanceVariationsWithDifferentNamesAreNotEqual() {
        let lhs = AppearanceVariation(name: "accent", appearance: TestAppearance(size: 1))
        let rhs = AppearanceVariation(name: "secondary", appearance: TestAppearance(size: 1))

        XCTAssertNotEqual(lhs, rhs)
    }

    func testAppearanceVariationDefaultsToAnEmptyName() {
        let variation = AppearanceVariation(appearance: TestAppearance(size: 1))

        XCTAssertEqual(variation.name, "")
        XCTAssertEqual(variation.id, "")
    }

    func testAppearanceVariationsDeduplicateBySetInsertion() {
        let set: Set = [
            AppearanceVariation(name: "accent", appearance: TestAppearance(size: 1)),
            AppearanceVariation(name: "accent", appearance: TestAppearance(size: 2)),
            AppearanceVariation(name: "secondary", appearance: TestAppearance(size: 1))
        ]

        XCTAssertEqual(set.count, 2)
    }

    // MARK: - ComponentAppearanceVariation

    func testComponentAppearanceVariationHasNoStylesByDefault() {
        let variation = ComponentAppearanceVariation<Self, TestAppearance>(
            name: "l",
            appearance: TestAppearance(size: 1)
        )

        XCTAssertTrue(variation.styles.isEmpty)
    }

    func testComponentAppearanceVariationBridgesIntoVariationPreservingNameAndAppearance() {
        let component = ComponentAppearanceVariation<Self, TestAppearance>(
            name: "l",
            appearance: TestAppearance(size: 3)
        )

        let variation = component.variation

        XCTAssertEqual(variation.name, "l")
        XCTAssertEqual(variation.appearance, TestAppearance(size: 3))
        XCTAssertTrue(variation.styles.isEmpty)
    }

    func testComponentAppearanceVariationsWithSameNameAreEqual() {
        let lhs = ComponentAppearanceVariation<Self, TestAppearance>(name: "l", appearance: TestAppearance(size: 1))
        let rhs = ComponentAppearanceVariation<Self, TestAppearance>(name: "l", appearance: TestAppearance(size: 9))

        XCTAssertEqual(lhs, rhs)
    }

    // MARK: - Variation

    func testVariationKeepsStylesAndComparesByName() {
        let styles = [
            AppearanceVariation(name: "accent", appearance: TestAppearance(size: 1)),
            AppearanceVariation(name: "secondary", appearance: TestAppearance(size: 2))
        ]
        let lhs = Variation(originalVariation: "l", styles: styles, name: "l", appearance: TestAppearance(size: 1))
        let rhs = Variation(originalVariation: "other", styles: [], name: "l", appearance: TestAppearance(size: 5))

        XCTAssertEqual(lhs.styles.map(\.name), ["accent", "secondary"])
        XCTAssertEqual(lhs, rhs)
        XCTAssertEqual(lhs.hashValue, rhs.hashValue)
    }
}
