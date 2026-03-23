@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class PaginationDotsSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testPaginationDotsHorizontalM() async throws {
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
    func testPaginationDotsHorizontalMActiveTypeLine() async throws {
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
    func testPaginationDotsVerticalM() async throws {
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
    func testPaginationDotsVerticalMActiveTypeLine() async throws {
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
    func testPaginationDotsVerticalMActiveTypeLineItemTenVisibleSeven() async throws {
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
    func testPaginationDotsHorizontalSItemThreeVisibleThree() async throws {
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
    func testPaginationDotsHorizontalSActiveTypeLine() async throws {
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
    func testPaginationDotsHorizontalMItemOneVisibleOne() async throws {
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
    func testPaginationDotsHorizontalMSelectedFive() async throws {
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
