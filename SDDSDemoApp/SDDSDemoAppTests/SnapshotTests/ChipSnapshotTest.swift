//
//  ChipSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ChipSnapshotTest: XCTestCase {
    
    func testChipSizeLDefaultHasClear() async throws {
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear())
    }
    
    func testChipSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled())
    }
    
    func testChipSizeSAccent() async throws {
        try await runSnapshotTest(view: ChipSizeSAccent())
    }
    
    func testChipSizeXsDefaultIcon() async throws {
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon())
    }
    
    func testChipSizeLDisabled() async throws {
        try await runSnapshotTest(view: ChipSizeLDisabled())
    }
    
    func testChipGroupLDense() async throws {
        try await runSnapshotTest(view: ChipGroupLDense())
    }

    func testChipGroupMSecondary() async throws {
        try await runSnapshotTest(view: ChipGroupMSecondary())
    }

    func testChipGroupSAccent() async throws {
        try await runSnapshotTest(view: ChipGroupSAccent())
    }

    func testChipGroupXs() async throws {
        try await runSnapshotTest(view: ChipGroupXs())
    }

    func testChipGroupLSecondaryPilled() async throws {
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled())
    }

    func testChipGroupMAccentWide() async throws {
        try await runSnapshotTest(view: ChipGroupMAccentWide())
    }

    func testChipGroupLSecondaryHasClose() async throws {
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose())
    }
    
}
