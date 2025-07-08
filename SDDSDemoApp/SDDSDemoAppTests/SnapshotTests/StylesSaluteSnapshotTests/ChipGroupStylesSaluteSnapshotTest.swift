//
//  ChipGroupPlasmaB2CSnapshotTest.swift
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

final class ChipGroupStylesSaluteSnapshotTest: XCTestCase {
    
    @MainActor
    func testChipGroupLDenseStylesSalute() async throws {
        let appearance = Chip.l.default.appearance
        let chipGroupAppearance = ChipGroupDense.l.default.appearance
        try await runSnapshotTest(view: ChipGroupLDense(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMSecondaryStylesSalute() async throws {
        let appearance = Chip.m.secondary.appearance
        let chipGroupAppearance = ChipGroupWide.m.secondary.appearance
        try await runSnapshotTest(view: ChipGroupMSecondary(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupSAccentStylesSalute() async throws {
        let appearance = Chip.s.accent.appearance
        let chipGroupAppearance = ChipGroupDense.s.accent.appearance
        try await runSnapshotTest(view: ChipGroupSAccent(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupXsStylesSalute() async throws {
        let appearance = Chip.xs.default.appearance
        let chipGroupAppearance = ChipGroupDense.xs.default.appearance
        try await runSnapshotTest(view: ChipGroupXs(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryPilledStylesSalute() async throws {
        let appearance = Chip.l.pilled.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMAccentWideStylesSalute() async throws {
        let appearance = Chip.m.accent.appearance
        let chipGroupAppearance = ChipGroupWide.m.accent.appearance
        try await runSnapshotTest(view: ChipGroupMAccentWide(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryHasCloseStylesSalute() async throws {
        let appearance = Chip.l.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
}
