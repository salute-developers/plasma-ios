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
#if PLASMA_THEME
import PlasmaB2CTheme
#elseif SALUTE_THEME
import StylesSaluteTheme
#else
import SDDSServTheme
#endif
import UIKit
import SwiftUI

final class SwitchSnapshotTest: XCTestCase {
    
    @MainActor
    func testSwitchSizeL() async throws {
        try await runSnapshotTest(view: SwitchSizeL())
    }
    
    @MainActor
    func testSwitchSizeM() async throws {
        try await runSnapshotTest(view: SwitchSizeM())
    }
    
    @MainActor
    func testSwitchSizeS() async throws {
        try await runSnapshotTest(view: SwitchSizeS())
    }
    
    @MainActor
    func testSwitchSizeDisabled() async throws {
        try await runSnapshotTest(view: SwitchSizeDisabled())
    }
    
    @MainActor
    func testSwitchSizeDisabledOff() async throws {
        try await runSnapshotTest(view: SwitchSizeDisabledOff())
    }
}
