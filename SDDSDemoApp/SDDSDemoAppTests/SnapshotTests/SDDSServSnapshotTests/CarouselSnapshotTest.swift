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
    
    func testCarouselStartButtonsPlacementInner() async throws {
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
        
    func testCarouselCenterButtonsPlacementOuter() async throws {
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
    
    func testCarouselEndButtonPlacementInner() async throws {
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
    
    func testCarouselCenterButtonsPlacementInner() async throws {
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
