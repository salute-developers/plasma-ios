//
//  CellSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CellSnapshotTest: SDDSServThemeTestCase {
    
    @MainActor
    func testCellSizeLAvatarHasDisclosure() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMTitleAvatar() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMTitleAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeSSubtitleHasDisclosure() async throws {
        let appearance = Cell.s.appearance
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeXsLabelAvatar() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsLabelAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellLHasDisclosureText() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellLHasDisclosureText(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMAvatarIcon() async throws {
        let appearance = Cell.m.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeMAvatarIcon(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeSIconHasDisclosureText() async throws {
        let appearance = Cell.s.appearance
        let iconButtonAppearance = IconButton.s.clear.appearance
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText(appearance: appearance, iconButtonAppearance: iconButtonAppearance))
    }
    
    @MainActor
    func testCellSizeXsRadioboxAvatar() async throws {
        let appearance = Cell.xs.appearance
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeLSwitchCheckbox() async throws {
        let appearance = Cell.l.appearance
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox(appearance: appearance))
    }
    
    @MainActor
    func testCellSizeMCheckboxHasDisclosure() async throws {
        let appearance = Cell.m.appearance
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure(appearance: appearance))
    }
}
