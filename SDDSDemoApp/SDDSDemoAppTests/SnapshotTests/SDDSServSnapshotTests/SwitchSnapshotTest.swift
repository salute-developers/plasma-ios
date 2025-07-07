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
    
    @MainActor
    func testSwitchSizeL() async throws {
        let appearance = Switch.l.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeM() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeS() async throws {
        let appearance = Switch.s.appearance
        try await runSnapshotTest(view: SwitchSizeS(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabled() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabled(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledOff() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabledOff(appearance: appearance))
    }
}
