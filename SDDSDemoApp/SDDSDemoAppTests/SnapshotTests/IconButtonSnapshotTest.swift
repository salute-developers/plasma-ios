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
    
    func testIсonButtonLDefault() async throws {
        try await runSnapshotTest(view: IсonButtonLDefault())
    }
    
    func testIconButtonMAccent() async throws {
        try await runSnapshotTest(view: IconButtonMAccent())
    }
    
    func testIconButtonSWarning() async throws {
        try await runSnapshotTest(view: IconButtonSWarning())
    }
    
    func testIconButtonXsDark() async throws {
        try await runSnapshotTest(view: IconButtonXsDark())
    }
    
    func testIconButtonIsLoading() async throws {
        try await runSnapshotTest(view: IconButtonIsLoading())
    }
    
    func testIconButtonIsDisabled() async throws {
        try await runSnapshotTest(view: IconButtonIsDisabled())
    }
    
    func testIconButtonLSecondaryPilled() async throws {
        try await runSnapshotTest(view: IconButtonLSecondaryPilled())
    }
    
    func testIconButtonMClear() async throws {
        try await runSnapshotTest(view: IconButtonMClear())
    }
    
    func testIconButtonSPositive() async throws {
        try await runSnapshotTest(view: IconButtonSPositive())
    }
    
    func testIconButtonXsNegativePilledIsLoading() async throws {
        try await runSnapshotTest(view: IconButtonXsNegativePilledIsLoading())
    }
    
    func testIconButtonLWhite() async throws {
        try await runSnapshotTest(view: IconButtonLWhite())
    }
    
    func testIconButtonXlDefault() async throws {
        try await runSnapshotTest(view: IconButtonXlDefault())
    }
    
    func testIconButtonXxsDefault() async throws {
        try await runSnapshotTest(view: IconButtonXxsDefault())
    }
}
