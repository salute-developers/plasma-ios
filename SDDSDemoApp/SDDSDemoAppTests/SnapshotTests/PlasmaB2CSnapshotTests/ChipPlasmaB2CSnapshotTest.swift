//
//  ChipPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class ChipPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testChipSizeLDefaultHasClearPlasmaB2C() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeMSecondaryPilledPlasmaB2C() async throws {
        let appearance = Chip.m.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeSAccentPlasmaB2C() async throws {
        let appearance = Chip.s.accent.appearance
        try await runSnapshotTest(view: ChipSizeSAccent(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeXsDefaultIconPlasmaB2C() async throws {
        let appearance = Chip.xs.default.appearance
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeLDisabledPlasmaB2C() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDisabled(appearance: appearance))
    }
}
