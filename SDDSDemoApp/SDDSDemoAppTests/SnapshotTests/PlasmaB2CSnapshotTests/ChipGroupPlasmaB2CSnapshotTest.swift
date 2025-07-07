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
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class ChipGroupPlasmaB2CSnapshotTest: XCTestCase {
    
    @MainActor
    func testChipGroupLDensePlasmaB2C() async throws {
        let appearance = Chip.l.default.appearance
        let chipGroupAppearance = ChipGroupDense.l.default.appearance
        try await runSnapshotTest(view: ChipGroupLDense(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMSecondaryPlasmaB2C() async throws {
        let appearance = Chip.m.secondary.appearance
        let chipGroupAppearance = ChipGroupWide.m.secondary.appearance
        try await runSnapshotTest(view: ChipGroupMSecondary(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupSAccentPlasmaB2C() async throws {
        let appearance = Chip.s.accent.appearance
        let chipGroupAppearance = ChipGroupDense.s.accent.appearance
        try await runSnapshotTest(view: ChipGroupSAccent(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupXsPlasmaB2C() async throws {
        let appearance = Chip.xs.default.appearance
        let chipGroupAppearance = ChipGroupDense.xs.default.appearance
        try await runSnapshotTest(view: ChipGroupXs(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryPilledPlasmaB2C() async throws {
        let appearance = Chip.l.pilled.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMAccentWidePlasmaB2C() async throws {
        let appearance = Chip.m.accent.appearance
        let chipGroupAppearance = ChipGroupWide.m.accent.appearance
        try await runSnapshotTest(view: ChipGroupMAccentWide(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryHasClosePlasmaB2C() async throws {
        let appearance = Chip.l.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
}
