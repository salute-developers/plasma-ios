//
//  SwitchPlasmaB2CSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 07.07.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaB2CTheme
import UIKit
import SwiftUI

final class SwitchPlasmaB2CSnapshotTest: PlasmaB2CThemeTestCase {
    
    @MainActor
    func testSwitchSizeLPlasmaB2C() async throws {
        let appearance = Switch.l.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeMPlasmaB2C() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeSPlasmaB2C() async throws {
        let appearance = Switch.s.appearance
        try await runSnapshotTest(view: SwitchSizeS(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledPlasmaB2C() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabled(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledOffPlasmaB2C() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabledOff(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeLToggleSPlasmaB2C() async throws {
        let appearance = Switch.l.toggleS.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeSToggleSPlasmaB2C() async throws {
        let appearance = Switch.s.toggleS.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
}
