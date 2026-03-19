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
}
