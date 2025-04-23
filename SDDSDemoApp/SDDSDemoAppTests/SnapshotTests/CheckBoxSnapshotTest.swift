//
//  CheckBoxSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 23.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class CheckBoxSnapshotTest: XCTestCase {
    
    func testCheckBoxSizeLNegative() async throws {
        try await runSnapshotTest(view: CheckBoxSizeLNegative())
    }
    
    func testCheckBoxSizeLNegativeUnchecked() async throws {
        try await runSnapshotTest(view: CheckBoxSizeLNegativeUnchecked())
    }
    
    func testCheckBoxSizeM() async throws {
        try await runSnapshotTest(view: CheckBoxSizeM())
    }
    
    func testCheckBoxSizeS() async throws {
        try await runSnapshotTest(view: CheckBoxSizeS())
    }
    
    func testCheckBoxSizeSDisabled() async throws {
        try await runSnapshotTest(view: CheckBoxSizeSDisabled())
    }
    
    func testCheckBoxSizeMIndeterminate() async throws {
        try await runSnapshotTest(view: CheckBoxSizeMIndeterminate())
    }
    
    func testCheckBoxSizeMNoLabelNoDescription() async throws {
        try await runSnapshotTest(view: CheckBoxSizeMNoLabelNoDescription())
    }
    
    func testCheckBoxGroupSizeM() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeM())
    }
    
    func testCheckBoxGroupSizeS() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeS())
    }
    
    func testCheckBoxGroupSizeMDisabled() async throws {
        try await runSnapshotTest(view: CheckBoxGroupSizeMDisabled())
    }
}
