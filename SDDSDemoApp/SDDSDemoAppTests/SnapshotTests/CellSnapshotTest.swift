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

final class CellSnapshotTest: XCTestCase {
    
    func testCellSizeLAvatarHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeLAvatarHasDisclosure())
    }
    
    func testCellSizeMTitleAvatar() async throws {
        try await runSnapshotTest(view: CellSizeMTitleAvatar())
    }
    
    func testCellSizeSSubtitleHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeSSubtitleHasDisclosure())
    }
    
    func testCellSizeXsLabelAvatar() async throws {
        try await runSnapshotTest(view: CellSizeXsLabelAvatar())
    }
    
    func testCellLHasDisclosureText() async throws {
        try await runSnapshotTest(view: CellLHasDisclosureText())
    }
    
    func testCellSizeMAvatarIcon() async throws {
        try await runSnapshotTest(view: CellSizeMAvatarIcon())
    }
    
    func testCellSizeSIconHasDisclosureText() async throws {
        try await runSnapshotTest(view: CellSizeSIconHasDisclosureText())
    }
    
    func testCellSizeXsRadioboxAvatar() async throws {
        try await runSnapshotTest(view: CellSizeXsRadioboxAvatar())
    }
    
    func testCellSizeLSwitchCheckbox() async throws {
        try await runSnapshotTest(view: CellSizeLSwitchCheckbox())
    }
    
    func testCellSizeMCheckboxHasDisclosure() async throws {
        try await runSnapshotTest(view: CellSizeMCheckboxHasDisclosure())
    }
}
