//
//  RadioBoxSnapshotTest.swift
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

final class RadioBoxSnapshotTest: XCTestCase {
    
    func testRadioBoxSizeM() async throws {
        try await runSnapshotTest(view: RadioBoxSizeM())
    }
    
    func testRadioBoxSizeSUnchecked() async throws {
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked())
    }
    
    func testRadioBoxSizeMNoDescription() async throws {
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription())
    }
    
    func testRadioBoxSizeMDisabled() async throws {
        try await runSnapshotTest(view: RadioBoxSizeMDisabled())
    }
    
    func testRadioBoxGroupSizeM() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeM())
    }
    
    func testRadioBoxGroupSizeS() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeS())
    }
    
    func testRadioBoxGroupSizeMDescription() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription())
    }
    
    func testRadioBoxGroupSizeSLabel() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel())
    }
}
