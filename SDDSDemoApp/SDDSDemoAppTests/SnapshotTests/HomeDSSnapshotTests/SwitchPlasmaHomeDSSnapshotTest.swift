//
//  SwitchPlasmaHomeDSSnapshotTest.swift
//  SDDSDemoApp
//
//  Created by Булинов Ангрик Александрович on 12.08.2025.
//

@testable import SDSnapshots
@testable import SDDSDemoApp
@testable import SDDSComponents
@testable import SDDSIcons
import XCTest
import PlasmaHomeDSTheme
import UIKit
import SwiftUI

final class SwitchPlasmaHomeDSSnapshotTest: XCTestCase {
    
    @MainActor
    func testSwitchSizeLPlasmaHomeDS() async throws {
        let appearance = Switch.l.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeMPlasmaHomeDS() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeSPlasmaHomeDS() async throws {
        let appearance = Switch.s.appearance
        try await runSnapshotTest(view: SwitchSizeS(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledPlasmaHomeDS() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabled(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeDisabledOffPlasmaHomeDS() async throws {
        let appearance = Switch.m.appearance
        try await runSnapshotTest(view: SwitchSizeDisabledOff(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeLToggleSPlasmaHomeDS() async throws {
        let appearance = Switch.l.toggleS.appearance
        try await runSnapshotTest(view: SwitchSizeL(appearance: appearance))
    }
    
    @MainActor
    func testSwitchSizeSToggleSPlasmaHomeDS() async throws {
        let appearance = Switch.s.toggleS.appearance
        try await runSnapshotTest(view: SwitchSizeM(appearance: appearance))
    }
}
