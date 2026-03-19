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
}
