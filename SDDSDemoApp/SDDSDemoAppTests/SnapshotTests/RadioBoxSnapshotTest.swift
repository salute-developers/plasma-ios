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
    
    @MainActor
    func testRadioBoxSizeM() async throws {
        try await runSnapshotTest(view: RadioBoxSizeM())
    }
    
    @MainActor
    func testRadioBoxSizeSUnchecked() async throws {
        try await runSnapshotTest(view: RadioBoxSizeSUnchecked())
    }
    
    @MainActor
    func testRadioBoxSizeMNoDescription() async throws {
        try await runSnapshotTest(view: RadioBoxSizeMNoDescription())
    }
    
    @MainActor
    func testRadioBoxSizeMDisabled() async throws {
        try await runSnapshotTest(view: RadioBoxSizeMDisabled())
    }
    
    @MainActor
    func testRadioBoxGroupSizeM() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeM())
    }
    
    @MainActor
    func testRadioBoxGroupSizeS() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeS())
    }
    
    @MainActor
    func testRadioBoxGroupSizeMDescription() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeMDescription())
    }
    
    @MainActor
    func testRadioBoxGroupSizeSLabel() async throws {
        try await runSnapshotTest(view: RadioBoxGroupSizeSLabel())
    }
}
