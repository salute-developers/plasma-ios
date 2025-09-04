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
    
    @MainActor
    func testChipSizeLDefaultHasClear() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeMSecondaryPilled() async throws {
        let appearance = Chip.m.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeSAccent() async throws {
        let appearance = Chip.s.accent.appearance
        try await runSnapshotTest(view: ChipSizeSAccent(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeXsDefaultIcon() async throws {
        let appearance = Chip.xs.default.appearance
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeLDisabled() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDisabled(appearance: appearance))
    }
}
