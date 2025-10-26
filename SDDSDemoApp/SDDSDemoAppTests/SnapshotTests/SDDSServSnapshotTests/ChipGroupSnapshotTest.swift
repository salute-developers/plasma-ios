//
//  ChipGroupSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 25.06.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class ChipGroupSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testChipGroupLDense() async throws {
        let appearance = Chip.l.default.appearance
        let chipGroupAppearance = ChipGroupDense.l.default.appearance
        try await runSnapshotTest(view: ChipGroupLDense(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMSecondary() async throws {
        let appearance = Chip.m.secondary.appearance
        let chipGroupAppearance = ChipGroupWide.m.secondary.appearance
        try await runSnapshotTest(view: ChipGroupMSecondary(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupSAccent() async throws {
        let appearance = Chip.s.accent.appearance
        let chipGroupAppearance = ChipGroupDense.s.accent.appearance
        try await runSnapshotTest(view: ChipGroupSAccent(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupXs() async throws {
        let appearance = Chip.xs.default.appearance
        let chipGroupAppearance = ChipGroupDense.xs.default.appearance
        try await runSnapshotTest(view: ChipGroupXs(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryPilled() async throws {
        let appearance = Chip.l.pilled.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.pilled.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryPilled(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupMAccentWide() async throws {
        let appearance = Chip.m.accent.appearance
        let chipGroupAppearance = ChipGroupWide.m.accent.appearance
        try await runSnapshotTest(view: ChipGroupMAccentWide(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
    
    @MainActor
    func testChipGroupLSecondaryHasClose() async throws {
        let appearance = Chip.l.secondary.appearance
        let chipGroupAppearance = ChipGroupDense.l.secondary.appearance
        try await runSnapshotTest(view: ChipGroupLSecondaryHasClose(appearance: appearance, chipGroupAppearance: chipGroupAppearance))
    }
}
