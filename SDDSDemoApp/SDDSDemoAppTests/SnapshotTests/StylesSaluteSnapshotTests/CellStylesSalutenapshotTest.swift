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
import StylesSaluteTheme
import UIKit
import SwiftUI

final class CellStylesSalutenapshotTest: XCTestCase {
    
    @MainActor
    func testCellSizeLAvatarHasDisclosureStylesSalute() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMTitleAvatarStylesSalute() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMTitleAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeSSubtitleHasDisclosureStylesSalute() async throws {
        let appearance = Cell.s.appearance
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeXsLabelAvatarStylesSalute() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsLabelAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellLHasDisclosureTextStylesSalute() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellLHasDisclosureText(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMAvatarIconStylesSalute() async throws {
        let appearance = Cell.m.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeMAvatarIcon(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeSIconHasDisclosureTextStylesSalute() async throws {
        let appearance = Cell.s.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeXsRadioboxAvatarStylesSalute() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeLSwitchCheckboxStylesSalute() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMCheckboxHasDisclosureStylesSalute() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure(appearance: appearance))
    }
}
