//
//  CellPlasmaB2CSnapshotTest.swift
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

final class CellPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testCellSizeLAvatarHasDisclosurePlasmaB2C() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMTitleAvatarPlasmaB2C() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMTitleAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeSSubtitleHasDisclosurePlasmaB2C() async throws {
        let appearance = Cell.s.appearance
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeXsLabelAvatarPlasmaB2C() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsLabelAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellLHasDisclosureTextPlasmaB2C() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellLHasDisclosureText(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMAvatarIconPlasmaB2C() async throws {
        let appearance = Cell.m.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeMAvatarIcon(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeSIconHasDisclosureTextPlasmaB2C() async throws {
        let appearance = Cell.s.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeXsRadioboxAvatarPlasmaB2C() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeLSwitchCheckboxPlasmaB2C() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMCheckboxHasDisclosurePlasmaB2C() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure(appearance: appearance))
    }
}
