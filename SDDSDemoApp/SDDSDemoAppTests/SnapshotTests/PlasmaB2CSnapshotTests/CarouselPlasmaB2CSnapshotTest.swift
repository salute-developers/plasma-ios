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
                pageCount: 7
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
    
    func testCarouselStartButtonsPlacementInnerPlasmaB2C() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 10,
                pageAlignment: .start,
            )
        )
    }
        
    func testCarouselCenterButtonsPlacementOuterPlasmaB2C() async throws {
        var appearance = Carousel.buttonsPlacementOuter.appearance
        appearance.size = DefaultCarouselSize(
            gap: 0,
            indicatorPadding: appearance.size.indicatorPadding,
            nextButtonPadding: appearance.size.nextButtonPadding,
            prevButtonPadding: appearance.size.prevButtonPadding,
            buttonsPlacement: appearance.size.buttonsPlacement
        )
        
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 10,
                hasIndicator: false,
                pageAlignment: .center,
            )
        )
    }
    
    func testCarouselEndButtonPlacementInnerPlasmaB2C() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 10,
                indicatorVisibleCount: 10,
                pageAlignment: .end,
            )
        )
    }
    
    func testCarouselCenterButtonsPlacementInnerPlasmaB2C() async throws {
        let appearance = Carousel.buttonsPlacementInner.appearance
        try await runSnapshotTest(
            view: CarouselSnapshotCase(
                appearance: appearance,
                selection: 1,
                pageCount: 10,
                hasIndicator: false,
                hasControls: false,
                pageAlignment: .center,
            )
        )
    }
}
