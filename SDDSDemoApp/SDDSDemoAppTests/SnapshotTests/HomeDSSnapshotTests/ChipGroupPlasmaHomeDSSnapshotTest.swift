//
//  ChipGroupPlasmaHomeDSSnapshotTest.swift
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

final class ChipGroupPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testChipGroupLDensePlasmaHomeDS() async throws {
        let appearance = Chip.l.default.appearance
        let chipGroupAppearance = ChipGroupDense.l.default.appearance
        try await runSnapshotTest(view: ChipGroupLDense(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMSecondaryPlasmaHomeDS() async throws {
        let appearance = Chip.m.secondary.appearance
        let chipGroupAppearance = ChipGroupWide.m.secondary.appearance
        try await runSnapshotTest(view: ChipGroupMSecondary(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupSDefaultPlasmaHomeDS() async throws {
        let appearance = Chip.s.default.appearance
        let chipGroupAppearance = ChipGroupDense.s.default.appearance
        try await runSnapshotTest(view: ChipGroupSAccent(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupXsPlasmaHomeDS() async throws {
        let appearance = Chip.xs.default.appearance
        let chipGroupAppearance = ChipGroupDense.xs.default.appearance
        try await runSnapshotTest(view: ChipGroupXs(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryPilledPlasmaHomeDS() async throws {
        let appearance = Chip.l.pilled.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMDefaultWidePlasmaHomeDS() async throws {
        let appearance = Chip.m.default.appearance
        let chipGroupAppearance = ChipGroupWide.m.default.appearance
        try await runSnapshotTest(view: ChipGroupMAccentWide(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryHasClosePlasmaHomeDS() async throws {
        let appearance = Chip.l.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
}
