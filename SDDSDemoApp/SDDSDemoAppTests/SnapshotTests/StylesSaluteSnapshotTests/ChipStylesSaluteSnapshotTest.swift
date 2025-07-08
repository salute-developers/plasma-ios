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
import StylesSaluteTheme
import UIKit
import SwiftUI

final class ChipStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testChipSizeLDefaultHasClearStylesSalute() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeMSecondaryPilledStylesSalute() async throws {
        let appearance = Chip.m.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeSAccentStylesSalute() async throws {
        let appearance = Chip.s.accent.appearance
        try await runSnapshotTest(view: ChipSizeSAccent(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeXsDefaultIconStylesSalute() async throws {
        let appearance = Chip.xs.default.appearance
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon(appearance: appearance))
    }
    
    @MainActor
    func testChipSizeLDisabledStylesSalute() async throws {
        let appearance = Chip.l.default.appearance
        try await runSnapshotTest(view: ChipSizeLDisabled(appearance: appearance))
    }
}
