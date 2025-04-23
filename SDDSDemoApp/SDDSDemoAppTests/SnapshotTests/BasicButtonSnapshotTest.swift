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
    
    func testButtonLDefault() async throws {
        try await runSnapshotTest(view: ButtonLDefault())
    }
    
    func testButtonMAccent() async throws {
        try await runSnapshotTest(view: ButtonMAccent())
    }
    
    func testButtonSWarning() async throws {
        try await runSnapshotTest(view: ButtonSWarning())
    }
    
    func testButtonXsDark() async throws {
        try await runSnapshotTest(view: ButtonXsDark())
    }
    
    func testButtonIsLoading() async throws {
        try await runSnapshotTest(view: ButtonLIsLoading())
    }
    
    func testButtonIsDisabled() async throws {
        try await runSnapshotTest(view: ButtonLIsDisabled())
    }
    
    func testButtonLSecondary() async throws {
        try await runSnapshotTest(view: ButtonLSecondary())
    }
    
    func testButtonMClearSpaceBetween() async throws {
        try await runSnapshotTest(view: ButtonMClearSpaceBetween())
    }
    
    func testButtonSPositiveLongText() async throws {
        try await runSnapshotTest(view: ButtonSPositiveLongText())
    }
    
    func testButtonXlDefault() async throws {
        try await runSnapshotTest(view: ButtonXlDefault())
    }
    
    func testButtonXxsDefault() async throws {
        try await runSnapshotTest(view:ButtonXxsDefault())
    }
}
