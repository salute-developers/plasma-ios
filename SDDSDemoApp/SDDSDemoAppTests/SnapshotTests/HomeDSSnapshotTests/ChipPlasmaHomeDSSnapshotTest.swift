//
//  ChipPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class ChipPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testChipSizeLDefaultHasClearPlasmaHomeDS() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeMSecondaryPilledPlasmaHomeDS() async throws {
        let appearance = Chip.m.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeSDefaultPlasmaHomeDS() async throws {
        let appearance = Chip.s.default.appearance
        try await runSnapshotTest(view: ChipSizeSAccent(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeXsDefaultIconPlasmaHomeDS() async throws {
        let appearance = Chip.xs.default.appearance
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeXxsDefaultPlasmaHomeDS() async throws {
        let appearance = Chip.xxs.default.appearance
        try await runSnapshotTest(view: ChipSizeSAccent(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeLDisabledPlasmaHomeDS() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDisabled(appearance: appearance))
    }
}
