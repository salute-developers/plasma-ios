//
//  SwitchSnapshotTest.swift
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

final class SwitchSnapshotTest: XCTestCase {
    
    func testSwitchSizeL() async throws {
        try await runSnapshotTest(view: SwitchSizeL())
    }
    
    func testSwitchSizeM() async throws {
        try await runSnapshotTest(view: SwitchSizeM())
    }
    
    func testSwitchSizeS() async throws {
        try await runSnapshotTest(view: SwitchSizeS())
    }
    
    func testSwitchSizeDisabled() async throws {
        try await runSnapshotTest(view: SwitchSizeDisabled())
    }
    
    func testSwitchSizeDisabledOff() async throws {
        try await runSnapshotTest(view: SwitchSizeDisabledOff())
    }
}
