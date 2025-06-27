//
//  BasicButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 15.04.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI


final class BasicButtonSnapshotTest: XCTestCase {
    
    @MainActor
    func testButtonLDefault() async throws {
        try await runSnapshotTest(view: ButtonLDefault())
    }
    
    @MainActor
    func testButtonMAccent() async throws {
        try await runSnapshotTest(view: ButtonMAccent())
    }
    
    @MainActor
    func testButtonSWarning() async throws {
        try await runSnapshotTest(view: ButtonSWarning())
    }
    
    @MainActor
    func testButtonXsDark() async throws {
        try await runSnapshotTest(view: ButtonXsDark())
    }
    
    @MainActor
    func testButtonIsLoading() async throws {
        try await runSnapshotTest(view: ButtonLIsLoading())
    }
    
    @MainActor
    func testButtonIsDisabled() async throws {
        try await runSnapshotTest(view: ButtonLIsDisabled())
    }
    
    @MainActor
    func testButtonLSecondary() async throws {
        try await runSnapshotTest(view: ButtonLSecondary())
    }
    
    @MainActor
    func testButtonMClearSpaceBetween() async throws {
        try await runSnapshotTest(view: ButtonMClearSpaceBetween())
    }
    
    @MainActor
    func testButtonSPositiveLongText() async throws {
        try await runSnapshotTest(view: ButtonSPositiveLongText())
    }
    
    @MainActor
    func testButtonXlDefault() async throws {
        try await runSnapshotTest(view: ButtonXlDefault())
    }
    
    @MainActor
    func testButtonXxsDefault() async throws {
        try await runSnapshotTest(view:ButtonXxsDefault())
    }
}
