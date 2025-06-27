//
//  IconButtonSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 17.04.2025.
//
@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
import XCTest
import SDDSServTheme
import UIKit
import SwiftUI

final class IconButtonSnapshotTest: XCTestCase {
    
    @MainActor
    func testIсonButtonLDefault() async throws {
        try await runSnapshotTest(view: IсonButtonLDefault())
    }
    
    @MainActor
    func testIconButtonMAccent() async throws {
        try await runSnapshotTest(view: IconButtonMAccent())
    }
    
    @MainActor
    func testIconButtonSWarning() async throws {
        try await runSnapshotTest(view: IconButtonSWarning())
    }
    
    @MainActor
    func testIconButtonXsDark() async throws {
        try await runSnapshotTest(view: IconButtonXsDark())
    }
    
    @MainActor
    func testIconButtonIsLoading() async throws {
        try await runSnapshotTest(view: IconButtonIsLoading())
    }
    
    @MainActor
    func testIconButtonIsDisabled() async throws {
        try await runSnapshotTest(view: IconButtonIsDisabled())
    }
    
    @MainActor
    func testIconButtonLSecondaryPilled() async throws {
        try await runSnapshotTest(view: IconButtonLSecondaryPilled())
    }
    
    @MainActor
    func testIconButtonMClear() async throws {
        try await runSnapshotTest(view: IconButtonMClear())
    }
    
    @MainActor
    func testIconButtonSPositive() async throws {
        try await runSnapshotTest(view: IconButtonSPositive())
    }
    
    @MainActor
    func testIconButtonXsNegativePilledIsLoading() async throws {
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading())
    }
    
    @MainActor
    func testIconButtonLWhite() async throws {
        try await runSnapshotTest(view: IconButtonLWhite())
    }
    
    @MainActor
    func testIconButtonXlDefault() async throws {
        try await runSnapshotTest(view: IconButtonXlDefault())
    }
    
    @MainActor
    func testIconButtonXxsDefault() async throws {
        try await runSnapshotTest(view: IconButtonXxsDefault())
    }
}
