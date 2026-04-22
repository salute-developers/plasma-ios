@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import SwiftUI
import UIKit

@MainActor
final class CarouselSnapshotTest: SDDSServThemeTestCase {
    func testCarouselButtonsPlacementInner() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 7
            )
        )
    }

    func testCarouselButtonsPlacementOuter() async throws {
        let appearance = Carousel.buttonsPlacementOuter.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 0,
                pageCount: 5
            )
        )
    }

    func testCarouselFirstPage() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 0,
                pageCount: 4
            )
        )
    }
}
