@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class PaginationDotsPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testPaginationDotsHorizontalMPlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.m.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 0,
                totalCount: 20,
                visibleCount: 9
            )
        )
    }
    
    @MainActor
    func testPaginationDotsHorizontalMActiveTypeLinePlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.m.activeTypeLine.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 5,
                totalCount: 20,
                visibleCount: 9
            )
        )
    }
    
    @MainActor
    func testPaginationDotsVerticalMPlasmaB2C() async throws {
        let appearance = PaginationDotsVertical.m.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 5,
                totalCount: 20,
                visibleCount: 9
            )
        )
    }
    
    @MainActor
    func testPaginationDotsVerticalMActiveTypeLinePlasmaB2C() async throws {
        let appearance = PaginationDotsVertical.m.activeTypeLine.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 5,
                totalCount: 20,
                visibleCount: 9
            )
        )
    }
    
    @MainActor
    func testPaginationDotsVerticalMActiveTypeLineItemTenVisibleSevenPlasmaB2C() async throws {
        let appearance = PaginationDotsVertical.m.activeTypeLine.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 5,
                totalCount: 10,
                visibleCount: 7
            )
        )
    }
    
    @MainActor
    func testPaginationDotsHorizontalSItemThreeVisibleThreePlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.s.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 0,
                totalCount: 3,
                visibleCount: 3
            )
        )
    }
    
    @MainActor
    func testPaginationDotsHorizontalSActiveTypeLinePlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.s.activeTypeLine.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 0,
                totalCount: 7,
                visibleCount: 5
            )
        )
    }
    
    @MainActor
    func testPaginationDotsHorizontalMItemOneVisibleOnePlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.m.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 0,
                totalCount: 1,
                visibleCount: 1
            )
        )
    }
    
    @MainActor
    func testPaginationDotsHorizontalMSelectedFivePlasmaB2C() async throws {
        let appearance = PaginationDotsHorizontal.m.appearance
        try await runSnapshotTest(
            view: PaginationDotsSnapshotCase(
                appearance: appearance,
                selectedIndex: 5,
                totalCount: 20,
                visibleCount: 9
            )
        )
    }
}
