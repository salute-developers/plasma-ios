//
//  ChipSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class ChipSnapshotTest: XCTestCase {
    
    @MainActor
    func testChipSizeLDefaultHasClear() async throws {
        try await runSnapshotTest(view: ChipSizeLDefaultHasClear())
    }
    
    @MainActor
    func testChipSizeMSecondaryPilled() async throws {
        try await runSnapshotTest(view: ChipSizeMSecondaryPilled())
    }
    
    @MainActor
    func testChipSizeSAccent() async throws {
        try await runSnapshotTest(view: ChipSizeSAccent())
    }
    
    @MainActor
    func testChipSizeXsDefaultIcon() async throws {
        try await runSnapshotTest(view: ChipSizeXsDefaultIcon())
    }
    
    @MainActor
    func testChipSizeLDisabled() async throws {
        try await runSnapshotTest(view: ChipSizeLDisabled())
    }
}
