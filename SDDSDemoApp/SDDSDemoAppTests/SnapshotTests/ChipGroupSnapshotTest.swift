//
//  ChipGroupSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 25.06.2025.
//

#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import UIKit
import SwiftUI

final class ChipGroupSnapshotTest: XCTestCase {
    
    @MainActor
    func testChipGroupLDense() async throws {
        try await runSnapshotTest(view: ChipGroupLDense())
    }
    
    @MainActor
    func testChipGroupMSecondary() async throws {
        try await runSnapshotTest(view: ChipGroupMSecondary())
    }
    
    @MainActor
    func testChipGroupSAccent() async throws {
        try await runSnapshotTest(view: ChipGroupSAccent())
    }
    
    @MainActor
    func testChipGroupXs() async throws {
        try await runSnapshotTest(view: ChipGroupXs())
    }
    
    @MainActor
    func testChipGroupLSecondaryPilled() async throws {
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled())
    }
    
    @MainActor
    func testChipGroupMAccentWide() async throws {
        try await runSnapshotTest(view: ChipGroupMAccentWide())
    }
    
    @MainActor
    func testChipGroupLSecondaryHasClose() async throws {
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose())
    }
}
