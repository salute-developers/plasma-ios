//
//  CellSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import UIKit
import SwiftUI

final class CellSnapshotTest: XCTestCase {
    
    @MainActor
    func testCellSizeLAvatarHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure())
    }
    
    @MainActor
    func testCellSizeMTitleAvatar() async throws {
        try await runSnapshotTest(view: CellSizeMTitleAvatar())
    }
    
    @MainActor
    func testCellSizeSSubtitleHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure())
    }
    
    @MainActor
    func testCellSizeXsLabelAvatar() async throws {
        try await runSnapshotTest(view: CellSizeXsLabelAvatar())
    }
    
    @MainActor
    func testCellLHasDisclosureText() async throws {
        try await runSnapshotTest(view: CellLHasDisclosureText())
    }
    
    @MainActor
    func testCellSizeMAvatarIcon() async throws {
        try await runSnapshotTest(view: CellSizeMAvatarIcon())
    }
    
    @MainActor
    func testCellSizeSIconHasDisclosureText() async throws {
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText())
    }
    
    @MainActor
    func testCellSizeXsRadioboxAvatar() async throws {
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar())
    }
    
    @MainActor
    func testCellSizeLSwitchCheckbox() async throws {
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox())
    }
    
    @MainActor
    func testCellSizeMCheckboxHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure())
    }
}
