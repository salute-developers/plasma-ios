//
//  CheckBoxSnapshotTest.swift
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
import XCTest
import UIKit
import SwiftUI

final class CheckBoxSnapshotTest: XCTestCase {
    
    @MainActor
    func testCheckBoxSizeLNegative() async throws {
        try await runSnapshotTest(view: CheckBoxSizeLNegative())
    }
    
    @MainActor
    func testCheckBoxSizeLNegativeUnchecked() async throws {
        try await runSnapshotTest(view: CheckBoxSizeLNegativeUnchecked())
    }
    
    @MainActor
    func testCheckBoxSizeM() async throws {
        try await runSnapshotTest(view: CheckBoxSizeM())
    }
    
    @MainActor
    func testCheckBoxSizeS() async throws {
        try await runSnapshotTest(view: CheckBoxSizeS())
    }
    
    @MainActor
    func testCheckBoxSizeSDisabled() async throws {
        try await runSnapshotTest(view: CheckBoxSizeSDisabled())
    }
    
    @MainActor
    func testCheckBoxSizeMIndeterminate() async throws {
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate())
    }
    
    @MainActor
    func testCheckBoxSizeMNoLabelNoDescription() async throws {
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription())
    }
    
    @MainActor
    func testCheckBoxGroupSizeM() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeM())
    }
    
    @MainActor
    func testCheckBoxGroupSizeS() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeS())
    }
    
    @MainActor
    func testCheckBoxGroupSizeMDisabled() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled())
    }
}
