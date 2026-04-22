@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import PlasmaB2CTheme
import SwiftUI
import UIKit

@MainActor
final class CarouselPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    func testCarouselButtonsPlacementInnerPlasmaB2C() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 6
            )
        )
    }

    func testCarouselButtonsPlacementOuterPlasmaB2C() async throws {
        let appearance = Carousel.buttonsPlacementOuter.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 0,
                pageCount: 5
            )
        )
    }

    func testCarouselFirstPagePlasmaB2C() async throws {
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
