//
//  CellPlasmaHomeDSSnapshotTest.swift
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

final class CellPlasmaHomeDSSnapshotTest: PlasmaHomeDSThemeTestCase {
    
    @MainActor
    func testCellSizeLAvatarHasDisclosurePlasmaHomeDS() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMTitleAvatarPlasmaHomeDS() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMTitleAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeSSubtitleHasDisclosurePlasmaHomeDS() async throws {
        let appearance = Cell.s.appearance
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeXsLabelAvatarPlasmaHomeDS() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsLabelAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellLHasDisclosureTextPlasmaHomeDS() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellLHasDisclosureText(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMAvatarIconPlasmaHomeDS() async throws {
        let appearance = Cell.m.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeMAvatarIcon(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeSIconHasDisclosureTextPlasmaHomeDS() async throws {
        let appearance = Cell.s.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeXsRadioboxAvatarPlasmaHomeDS() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeLSwitchCheckboxPlasmaHomeDS() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMCheckboxHasDisclosurePlasmaHomeDS() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure(appearance: appearance))
    }
}
